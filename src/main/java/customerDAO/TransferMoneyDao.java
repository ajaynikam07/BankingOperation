package customerDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Savepoint;

public class TransferMoneyDao {

    public String TrasnferMoney(String yourid, String customerid, long amount) {
        String msg = "Transaction Failed";

        try {
            // Establish connection
            Connection con = Test.getconn();

            // Set auto-commit to false for transaction management
            con.setAutoCommit(false);

            // Prepare statements for querying and updating balance
            PreparedStatement ps1 = con.prepareStatement("SELECT * FROM bankcustomer WHERE id = ?");
            PreparedStatement ps2 = con.prepareStatement("UPDATE bankcustomer SET balance = balance + ? WHERE id = ?");
            PreparedStatement ps3 = con.prepareStatement("UPDATE bankcustomer SET balance = balance - ? WHERE id = ?");

            // Set savepoint to allow rollback in case of failure
            Savepoint sp = con.setSavepoint();

            // Fetch your account balance
            ps1.setString(1, yourid);
            ResultSet rs1 = ps1.executeQuery();

            if (rs1.next()) {
                long bal = rs1.getLong("balance"); // Fetch the balance for your account

                // Check if the customer account exists
                ps1.setString(1, customerid);
                ResultSet rs2 = ps1.executeQuery();

                if (rs2.next()) {
                    // Verify if there is sufficient balance
                    if (amount <= bal) {
                        // Perform withdrawal (subtract from your account)
                        ps3.setLong(1, amount);
                        ps3.setString(2, yourid);
                        int p = ps3.executeUpdate();

                        // Perform deposit (add to customer account)
                        ps2.setLong(1, amount);
                        ps2.setString(2, customerid);
                        int q = ps2.executeUpdate();

                        if (p == 1 && q == 1) {
                            // Commit transaction if both updates are successful
                            con.commit();
                            msg = "Transaction Successful!";
                        } else {
                            // Rollback to the savepoint if any update fails
                            con.rollback(sp);
                            msg = "Transaction Failed!";
                        }
                    } else {
                        msg = "Insufficient Funds!";
                    }
                } else {
                    msg = "Invalid Customer Account Number!";
                }
            } else {
                msg = "Invalid Your Account Number!";
            }
        } catch (Exception e) {
            e.printStackTrace();
            msg = "Transaction Failed due to error: " + e.getMessage();
        }

        return msg;
    }
}
