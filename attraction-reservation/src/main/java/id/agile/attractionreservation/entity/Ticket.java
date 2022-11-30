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
	
	@Column(name="ticket_code")
	private String ticketCode;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "user_id", nullable = false)
	private User user;

	@Column(name="attraction_date")
	private String attractionDate;
	
	@Column(name="attraction_place_id")
	private String attractionPlaceId;
	
	@Column(name="place_name")
	private String placeName;
	
	
	


	
	public String getAttractionPlaceId() {
		return attractionPlaceId;
	}

	public void setAttractionPlaceId(String attractionPlaceId) {
		this.attractionPlaceId = attractionPlaceId;
	}

	public String getPlaceName() {
		return placeName;
	}

	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Ticket() {

	}

	public Ticket(int id, String bookingCode, String ticketCode, User user, String attractionDate) {
		super();
		this.id = id;
		this.bookingCode = bookingCode;
		this.ticketCode = ticketCode;
		this.user = user;
		this.attractionDate = attractionDate;
	}


	public String getBookingCode() {
		return bookingCode;
	}




	public void setBookingCode(String bookingCode) {
		this.bookingCode = bookingCode;
	}




	public String getTicketCode() {
		return ticketCode;
	}




	public void setTicketCode(String ticketCode) {
		this.ticketCode = ticketCode;
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

