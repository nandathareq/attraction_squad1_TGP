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
@Table(name = "sub_invoice_items")
public class InvoiceItem implements Serializable{

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="sub_invoice_item_id")
	private int id;
	
	
	@Column(name="qty")
	private double qty;
	
	@Column(name="sub_total")
	private double subTotal;
	
	@Column(name="status")
	private String status;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "attraction_schedule_id", nullable = false)
	private AttractionSchedule attractionSchedule;

	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "sub_invoice_id", nullable = false)
	private SubInvoice subInvoice;

	public InvoiceItem() {

	}
	
	
	public InvoiceItem(double qty, double subTotal, String status, AttractionSchedule attractionSchedule,
			SubInvoice subInvoice) {
		super();
		this.qty = qty;
		this.subTotal = subTotal;
		this.status = status;
		this.attractionSchedule = attractionSchedule;
		this.subInvoice = subInvoice;
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


	public void setQty(double qty) {
		this.qty = qty;
	}


	public double getSubTotal() {
		return subTotal;
	}


	public void setSubTotal(double subTotal) {
		this.subTotal = subTotal;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}




	public SubInvoice getSubInvoice() {
		return subInvoice;
	}


	public void setSubInvoice(SubInvoice subInvoice) {
		this.subInvoice = subInvoice;
	}


	public AttractionSchedule getAttractionSchedule() {
		return attractionSchedule;
	}


	public void setAttractionSchedule(AttractionSchedule attractionSchedule) {
		this.attractionSchedule = attractionSchedule;
	}


	

	

	
	
	


}

