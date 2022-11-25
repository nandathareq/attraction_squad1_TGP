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
@Table(name = "users")
public class User implements Serializable{

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="user_id")
	private int id;
	
	@Column(name="email")
	private String email;
	
	@JsonIgnore
	@Column(name="password")
	private String password;
	
	@Column(name="first_name")
	private String firstName;
	
	@Column(name="last_name")
	private String lastName;
	
	@Column(name="mobile_number")
	private String mobileNumber;
	
	@JsonIgnore
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY,
            cascade = CascadeType.ALL)
	private Set<AttractionReview> attractionReviews;
	public void addAttractionReview(AttractionReview attractionReview){
		attractionReviews.add(attractionReview);
		attractionReview.setUser(this);
    }
    public void removeAttractionReview(AttractionReview attractionReview){
    	attractionReviews.remove(attractionReview);
    	attractionReview.setUser(null);
    }
    
    @JsonIgnore
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY,
            cascade = CascadeType.ALL)
	private Set<SubInvoice> subInvoices;
	public void addSubInvoice(SubInvoice subInvoice){
		subInvoices.add(subInvoice);
		subInvoice.setUser(this);
    }
    public void removeSubInvoice(SubInvoice subInvoice){
    	subInvoices.remove(subInvoice);
    	subInvoice.setUser(null);
    }
    
    @JsonIgnore
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY,
            cascade = CascadeType.ALL)
	private Set<GrandInvoice> grandInvoices;
	public void addGrandInvoice(GrandInvoice grandInvoice){
		grandInvoices.add(grandInvoice);
		grandInvoice.setUser(this);
    }
    public void removeGrandInvoice(GrandInvoice grandInvoice){
    	grandInvoices.remove(grandInvoice);
    	grandInvoice.setUser(null);
    }
    @JsonIgnore
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY,
            cascade = CascadeType.ALL)
	private Set<Ticket> tickets;
	public void addTicket(Ticket ticket){
		tickets.add(ticket);
		ticket.setUser(this);
    }
    public void removeTicket(Ticket ticket){
    	tickets.remove(ticket);
    	ticket.setUser(null);
    }
    
    
	public User() {

	}
	public User(String email, String password, String firstName, String lastName, String mobileNumber,
			Set<AttractionReview> attractionReviews, Set<SubInvoice> subInvoices, Set<GrandInvoice> grandInvoices,
			Set<Ticket> tickets) {
		super();
		this.email = email;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.mobileNumber = mobileNumber;
		this.attractionReviews = attractionReviews;
		this.subInvoices = subInvoices;
		this.grandInvoices = grandInvoices;
		this.tickets = tickets;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public Set<AttractionReview> getAttractionReviews() {
		return attractionReviews;
	}
	public void setAttractionReviews(Set<AttractionReview> attractionReviews) {
		this.attractionReviews = attractionReviews;
	}
	public Set<SubInvoice> getSubInvoices() {
		return subInvoices;
	}
	public void setSubInvoices(Set<SubInvoice> subInvoices) {
		this.subInvoices = subInvoices;
	}
	public Set<GrandInvoice> getGrandInvoices() {
		return grandInvoices;
	}
	public void setGrandInvoices(Set<GrandInvoice> grandInvoices) {
		this.grandInvoices = grandInvoices;
	}
	public Set<Ticket> getTickets() {
		return tickets;
	}
	public void setTickets(Set<Ticket> tickets) {
		this.tickets = tickets;
	}

	
	
    
}
