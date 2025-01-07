package customerBean;

import java.io.Serializable;

@SuppressWarnings("serial")
public class CustomerBean implements Serializable
{
	private String id,password,fname,lname,city,email;
	private long phono,balance;
	
	public CustomerBean() {}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getPhono() {
		return phono;
	}

	public void setPhono(long phono) {
		this.phono = phono;
	}

	public long getBalance() {
		return balance;
	}

	public void setBalance(long balance) {
		this.balance = balance;
	}
	
	
}
