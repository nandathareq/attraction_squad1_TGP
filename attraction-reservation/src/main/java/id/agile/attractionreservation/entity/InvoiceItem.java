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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "sub_invoice_items")
public class InvoiceItem implements Serializable{

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="sub_invoice_item_id")
	private int id;
	
	@Column(name="qty")
	private int qty;
	
	@Column(name="attraction_place_id")
	private int attractionPlaceId;
	
	@Column(name="place_name")
	private String placeName;
	
	@Column(name="sub_total")
	private double subTotal;


	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "sub_invoice_id", nullable = false)
	private SubInvoice subInvoice;
	
	@Column(name="attraction_date")
	private String attractionDate;
	
	
	
	
	@ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "subInvoiceItem_ticket",
            joinColumns = @JoinColumn(name = "sub_invoice_item_id"),
            inverseJoinColumns = @JoinColumn(name = "ticket_id")
    )
    private Set<Ticket> tickets;
 
    public void addTicket(Ticket ticket) {
    	tickets.add(ticket);
    }
    public void removeTicket (Ticket ticket){
    	tickets.remove(ticket);

    }
	
	

	public String getAttractionDate() {
		return attractionDate;
	}
	public void setAttractionDate(String attractionDate) {
		this.attractionDate = attractionDate;
	}
	public InvoiceItem() {

	}
	public InvoiceItem(int qty, String placeName, double subTotal, SubInvoice subInvoice,
			Set<Ticket> tickets, int attractionPlaceId) {
		super();
		this.qty = qty;
		this.placeName = placeName;
		this.subTotal = subTotal;
		this.subInvoice = subInvoice;
		this.tickets = tickets;
		this.attractionPlaceId = attractionPlaceId;
	}
	
	public InvoiceItem(int qty, int attractionPlaceId,String placeName, double subTotal, SubInvoice subInvoice, String attractionDate) {
		super();
		this.qty = qty;
		this.placeName = placeName;
		this.subTotal = subTotal;
		this.subInvoice = subInvoice;
		this.attractionPlaceId = attractionPlaceId;
		this.attractionDate = attractionDate;
		
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public double getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	public double getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(double subTotal) {
		this.subTotal = subTotal;
	}
	public SubInvoice getSubInvoice() {
		return subInvoice;
	}
	public void setSubInvoice(SubInvoice subInvoice) {
		this.subInvoice = subInvoice;
	}
//	public Set<Ticket> getTickets() {
//		return tickets;
//	}
//	public void setTickets(Set<Ticket> tickets) {
//		this.tickets = tickets;
//	}
//	
	
	
	


}

