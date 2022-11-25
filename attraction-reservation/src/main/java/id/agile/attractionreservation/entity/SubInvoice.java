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
@Table(name = "sub_invoice")
public class SubInvoice implements Serializable{

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="sub_invoice_id")
	private int id;
	
//	@Column(name="attraction_schedule_id")
//	private int attractionScheduleId;
	
	@Column(name="qty")
	private int qty;
	
	@Column(name="total")
	private double total;
	
	@Column(name="raised_date")
	private String raisedDate;
	
	@Column(name="due_date")
	private String dueDate;
	
	@Column(name="status")
	private String status;
	
	@JsonIgnore
	@OneToMany(mappedBy = "subInvoice", fetch = FetchType.LAZY,
            cascade = CascadeType.ALL)
	private Set<InvoiceItem> invoiceItems;
	public void addInvoiceItem(InvoiceItem invoiceItem){
		invoiceItems.add(invoiceItem);
		invoiceItem.setSubInvoice(this);
    }
    public void removeInvoiceItem(InvoiceItem invoiceItem){
    	invoiceItems.remove(invoiceItem);
    	invoiceItem.setSubInvoice(null);
    }
    
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "grand_invoice_id", nullable = false)
	private GrandInvoice grandInvoice;

	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "user_id", nullable = false)
	private User user;
	
	@JsonIgnore
	@OneToMany(mappedBy = "subInvoice", fetch = FetchType.LAZY,
            cascade = CascadeType.ALL)
	private Set<Ticket> tickets;
	public void addTicket(Ticket ticket){
		tickets.add(ticket);
		ticket.setSubInvoice(this);
    }
    public void removeTicket(Ticket ticket){
    	tickets.remove(ticket);
    	ticket.setSubInvoice(null);
    }
    
    public SubInvoice() {

	}
    
	public SubInvoice( int qty, double total, String raisedDate, String dueDate, String status,
			Set<InvoiceItem> invoiceItems, GrandInvoice grandInvoice, User user, Set<Ticket> tickets) {
		super();

		this.qty = qty;
		this.total = total;
		this.raisedDate = raisedDate;
		this.dueDate = dueDate;
		this.status = status;
		this.invoiceItems = invoiceItems;
		this.grandInvoice = grandInvoice;
		this.user = user;
		this.tickets = tickets;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getRaisedDate() {
		return raisedDate;
	}
	public void setRaisedDate(String raisedDate) {
		this.raisedDate = raisedDate;
	}
	public String getDueDate() {
		return dueDate;
	}
	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Set<InvoiceItem> getInvoiceItems() {
		return invoiceItems;
	}
	public void setInvoiceItems(Set<InvoiceItem> invoiceItems) {
		this.invoiceItems = invoiceItems;
	}
	public GrandInvoice getGrandInvoice() {
		return grandInvoice;
	}
	public void setGrandInvoice(GrandInvoice grandInvoice) {
		this.grandInvoice = grandInvoice;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Set<Ticket> getTickets() {
		return tickets;
	}
	public void setTickets(Set<Ticket> tickets) {
		this.tickets = tickets;
	}
	
	

    

	

	

	

	
	
	
	
}

