package id.agile.attractionreservation.entity;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "ticket")
public class Ticket implements Serializable{

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ticket_id")
	private int id;
	
	@Column(name="booking_code")
	private String bookingCode;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "user_id", nullable = false)
	private User user;

	@Column(name="attraction_date")
	private String attractionDate;
	


	
	public Ticket() {

	}




	public Ticket(String bookingCode, User user, String attractionDate) {
		super();
		this.bookingCode = bookingCode;
		this.user = user;
		this.attractionDate = attractionDate;
	}




	public int getId() {
		return id;
	}




	public void setId(int id) {
		this.id = id;
	}




	public String getBookingCode() {
		return bookingCode;
	}




	public void setBookingCode(String bookingCode) {
		this.bookingCode = bookingCode;
	}




	public User getUser() {
		return user;
	}




	public void setUser(User user) {
		this.user = user;
	}




	public String getAttractionDate() {
		return attractionDate;
	}




	public void setAttractionDate(String attractionDate) {
		this.attractionDate = attractionDate;
	}
	
	

}

