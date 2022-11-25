package id.agile.attractionreservation.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
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
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "attraction_place")
public class AttractionPlace implements Serializable{

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="attraction_place_id")
	private int id;
	
	@Column(name="place_name")
	private String placeName;
	
	@Column(name="description")
	private String description;
	
	@Column(name="category")
	private String category;
	
	@Column(name="city")
	private String city;
	
	@Column(name="price")
	private long price;
	
	@Column(name="lattitude")
	private double lattitude;
	
	@Column(name="longitude")
	private double longitude;
	
	@Column(name="open_hour")
	private String openHour;
	
	@Column(name="close_hour")
	private String closeHour;
	
	@Transient
	private double placeRating;
	
	@JsonIgnore
	@OneToMany(mappedBy = "attractionPlace", fetch = FetchType.LAZY,
            cascade = CascadeType.ALL)
	private Set<AttractionReview> attractionReviews;
	public void addAttractionReview(AttractionReview attractionReview){
		attractionReviews.add(attractionReview);
		attractionReview.setAttractionPlace(this);
    }
    public void removeAttractionReview(AttractionReview attractionReview){
    	attractionReviews.remove(attractionReview);
    	attractionReview.setAttractionPlace(null);
    }
    
//    @JsonIgnore
//	@OneToMany(mappedBy = "attractionPlace", fetch = FetchType.LAZY,
//            cascade = CascadeType.ALL)
//	private Set<InvoiceItem> invoiceItems;
//	public void addInvoiceItem(InvoiceItem invoiceItem){
//		invoiceItems.add(invoiceItem);
//		invoiceItem.setAttractionPlace(this);
//    }
//    public void removeInvoiceItem(InvoiceItem invoiceItem){
//    	invoiceItems.remove(invoiceItem);
//    	invoiceItem.setAttractionPlace(null);
//    }
    
    @JsonIgnore
	@OneToMany(mappedBy = "attractionPlace", fetch = FetchType.LAZY,
            cascade = CascadeType.ALL)
	private Set<AttractionSchedule> attractionSchedules;
	public void addAttractionSchedule(AttractionSchedule attractionSchedule){
		attractionSchedules.add(attractionSchedule);
		attractionSchedule.setAttractionPlace(this);
    }
    public void removeAttractionSchedule(AttractionSchedule attractionSchedule){
    	attractionSchedules.remove(attractionSchedule);
    	attractionSchedule.setAttractionPlace(null);
    }
    
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "attraction_facility",
            joinColumns = @JoinColumn(name = "attraction_place_id"),
            inverseJoinColumns = @JoinColumn(name = "facility_id")
    )
    private Set<Facility> facilities;
 
    public void addFacility(Facility facility) {
    	facilities.add(facility);
    }
    public void removeFacility (Facility facility){
    	facilities.remove(facility);

    }
    
    
	public AttractionPlace() {

	}
	public AttractionPlace(String placeName, String description, String category, String city, long price,
			double lattitude, double longitude, String openHour, String closeHour, double placeRating,
			Set<AttractionReview> attractionReviews,
			Set<AttractionSchedule> attractionSchedules, Set<Facility> facilities) {
		super();
		this.placeName = placeName;
		this.description = description;
		this.category = category;
		this.city = city;
		this.price = price;
		this.lattitude = lattitude;
		this.longitude = longitude;
		this.openHour = openHour;
		this.closeHour = closeHour;
		this.placeRating = placeRating;
		this.attractionReviews = attractionReviews;

		this.attractionSchedules = attractionSchedules;
		this.facilities = facilities;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	public double getLattitude() {
		return lattitude;
	}
	public void setLattitude(double lattitude) {
		this.lattitude = lattitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public String getOpenHour() {
		return openHour;
	}
	public void setOpenHour(String openHour) {
		this.openHour = openHour;
	}
	public String getCloseHour() {
		return closeHour;
	}
	public void setCloseHour(String closeHour) {
		this.closeHour = closeHour;
	}
	public double getPlaceRating() {
		return placeRating;
	}
	public void setPlaceRating(double placeRating) {
		this.placeRating = placeRating;
	}
	public Set<AttractionReview> getAttractionReviews() {
		return attractionReviews;
	}
	public void setAttractionReviews(Set<AttractionReview> attractionReviews) {
		this.attractionReviews = attractionReviews;
	}

	public Set<AttractionSchedule> getAttractionSchedules() {
		return attractionSchedules;
	}
	public void setAttractionSchedules(Set<AttractionSchedule> attractionSchedules) {
		this.attractionSchedules = attractionSchedules;
	}
	public Set<Facility> getFacilities() {
		return facilities;
	}
	public void setFacilities(Set<Facility> facilities) {
		this.facilities = facilities;
	}
	
	
	
	
}

