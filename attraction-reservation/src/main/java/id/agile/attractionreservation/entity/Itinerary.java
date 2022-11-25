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
@Table(name = "itinerary")
public class Itinerary implements Serializable{

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="itinerary_id")
	private int id;
	
	@Column(name="itinerary_name")
	private String itinerary_name;
	
	@Column(name="total")
	private double total;
	
	@Column(name="city")
	private String city;
	
	@Column(name="user_id")
	private int user_id;
	

	
	
	
	
}

