package id.agile.attractionreservation.entity;

import java.io.Serializable;
import java.util.Collections;
import java.util.HashSet;
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
	
	
	@Column(name="total")
	private double total;
	
	@Column(name="booking_code")
	private String bookingCode;
	
	@Column(name="raised_date")
	private String raisedDate;
	
	@Column(name="due_date")
	private String dueDate;
	
	@Column(name="status")
	private String status;
	
	@JsonIgnore
	@OneToMany(mappedBy = "subInvoice", fetch = FetchType.LAZY,
            cascade = CascadeType.ALL)
	private Set<InvoiceItem> invoiceItems ;
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
	
    
    public SubInvoice() {

	}
    
	public SubInvoice(  double total, String raisedDate, String dueDate, String status,
			Set<InvoiceItem> invoiceItems, GrandInvoice grandInvoice, User user, String bookingCode) {
		super();
		this.bookingCode = bookingCode;
		this.total = total;
		this.raisedDate = raisedDate;
		this.dueDate = dueDate;
		this.status = status;
		this.invoiceItems = invoiceItems;
		this.grandInvoice = grandInvoice;
		this.user = user;

	}
	
	public SubInvoice(  double total, String raisedDate, String dueDate, String status,
			 GrandInvoice grandInvoice, User user) {
		super();

		this.total = total;
		this.raisedDate = raisedDate;
		this.dueDate = dueDate;
		this.status = status;
		this.invoiceItems =  new HashSet<>();
		this.grandInvoice = grandInvoice;
		this.user = user;

	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getBookingCode() {
		return bookingCode;
	}
	public void setBookingCode(String bookingCode) {
		this.bookingCode = bookingCode;
	}
	


    

	

	

	

	
	
	
	
}

