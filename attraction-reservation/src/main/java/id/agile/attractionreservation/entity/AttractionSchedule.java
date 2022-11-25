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
@Table(name = "attraction_schedule")
public class AttractionSchedule implements Serializable{

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="attraction_schedule_id")
	private int id;
	
	@Column(name="available_ticket")
	private int availableTicket;
	
	
	@Column(name="attraction_date")
	private String attractionDate;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "attraction_place_id", nullable = false)
	private AttractionPlace attractionPlace;
	
	@JsonIgnore
	@OneToMany(mappedBy = "attractionSchedule", fetch = FetchType.LAZY,
            cascade = CascadeType.ALL)
	private Set<Ticket> tickets;
	public void addTicket(Ticket ticket){
		tickets.add(ticket);
		ticket.setAttractionSchedule(this);
    }
    public void removeTicket(Ticket ticket){
    	tickets.remove(ticket);
    	ticket.setAttractionSchedule(null);
    }
    
    @JsonIgnore
	@OneToMany(mappedBy = "attractionSchedule", fetch = FetchType.LAZY,
          cascade = CascadeType.ALL)
	private Set<InvoiceItem> invoiceItems;
	public void addInvoiceItem(InvoiceItem invoiceItem){
		invoiceItems.add(invoiceItem);
		invoiceItem.setAttractionSchedule(this);
	}
	public void removeInvoiceItem(InvoiceItem invoiceItem){
		invoiceItems.remove(invoiceItem);
		invoiceItem.setAttractionSchedule(null);
	}
	
	public AttractionSchedule() {

	}
	public AttractionSchedule(int availableTicket, String attractionDate, AttractionPlace attractionPlace,
			Set<Ticket> tickets) {
		super();
		this.availableTicket = availableTicket;
		this.attractionDate = attractionDate;
		this.attractionPlace = attractionPlace;
		this.tickets = tickets;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAvailableTicket() {
		return availableTicket;
	}
	public void setAvailableTicket(int availableTicket) {
		this.availableTicket = availableTicket;
	}
	public String getAttractionDate() {
		return attractionDate;
	}
	public void setAttractionDate(String attractionDate) {
		this.attractionDate = attractionDate;
	}
	public AttractionPlace getAttractionPlace() {
		return attractionPlace;
	}
	public void setAttractionPlace(AttractionPlace attractionPlace) {
		this.attractionPlace = attractionPlace;
	}
	public Set<Ticket> getTickets() {
		return tickets;
	}
	public void setTickets(Set<Ticket> tickets) {
		this.tickets = tickets;
	}

	

}

