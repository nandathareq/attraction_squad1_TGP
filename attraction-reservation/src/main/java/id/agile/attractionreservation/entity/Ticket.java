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

	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "attraction_schedule_id", nullable = false)
	private AttractionSchedule attractionSchedule;

	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "grand_invoice_id", nullable = false)
	private GrandInvoice grandInvoice;

	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "sub_invoice_id", nullable = false)
	private SubInvoice subInvoice;

	
	public Ticket() {

	}
	
	public Ticket(String bookingCode, User user, AttractionSchedule attractionSchedule, GrandInvoice grandInvoice,
			SubInvoice subInvoice) {
		super();
		this.bookingCode = bookingCode;
		this.user = user;
		this.attractionSchedule = attractionSchedule;
		this.grandInvoice = grandInvoice;
		this.subInvoice = subInvoice;
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

	public AttractionSchedule getAttractionSchedule() {
		return attractionSchedule;
	}

	public void setAttractionSchedule(AttractionSchedule attractionSchedule) {
		this.attractionSchedule = attractionSchedule;
	}

	public GrandInvoice getGrandInvoice() {
		return grandInvoice;
	}

	public void setGrandInvoice(GrandInvoice grandInvoice) {
		this.grandInvoice = grandInvoice;
	}

	public SubInvoice getSubInvoice() {
		return subInvoice;
	}

	public void setSubInvoice(SubInvoice subInvoice) {
		this.subInvoice = subInvoice;
	}
	
	
	
	
	

	

	
	
	
	
}

