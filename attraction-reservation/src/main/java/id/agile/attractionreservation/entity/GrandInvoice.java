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
@Table(name = "grand_invoice")
public class GrandInvoice implements Serializable{

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="grand_invoice__id")
	private int id;
	
	
	@Column(name="grand_total")
	private double grandTotal;
	
	@Column(name="raised_date")
	private String raisedDate;
	
	@Column(name="due_date")
	private String dueDate;
	
	@Column(name="status")
	private String status;
	
	@JsonIgnore
	@OneToMany(mappedBy = "grandInvoice", fetch = FetchType.LAZY,
            cascade = CascadeType.ALL)
	private Set<SubInvoice> subInvoices ;
	public void addSubInvoice(SubInvoice subInvoice){
		subInvoices.add(subInvoice);
		subInvoice.setGrandInvoice(this);
    }
    public void removeSubInvoice(SubInvoice subInvoice){
    	subInvoices.remove(subInvoice);
    	subInvoice.setGrandInvoice(null);
    }
    
    
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "user_id", nullable = false)
	private User user;

    

    public GrandInvoice() {
		super();
	}
    
	public GrandInvoice(double grandTotal, String raisedDate, String dueDate, String status,
			Set<SubInvoice> subInvoices, User user) {
		super();
		this.grandTotal = grandTotal;
		this.raisedDate = raisedDate;
		this.dueDate = dueDate;
		this.status = status;
		this.subInvoices = subInvoices;
		this.user = user;

	}
	
	public GrandInvoice(double grandTotal, String raisedDate, String dueDate, String status,
 User user) {
		super();
		this.grandTotal = grandTotal;
		this.raisedDate = raisedDate;
		this.dueDate = dueDate;
		this.status = status;
		this.subInvoices = new HashSet<>();
		this.user = user;

	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public double getGrandTotal() {
		return grandTotal;
	}
	public void setGrandTotal(double grandTotal) {
		this.grandTotal = grandTotal;
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
	public Set<SubInvoice> getSubInvoices() {
		return subInvoices;
	}
	public void setSubInvoices(Set<SubInvoice> subInvoices) {
		this.subInvoices = subInvoices;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	
    
    
    

	
	
	
	
}

