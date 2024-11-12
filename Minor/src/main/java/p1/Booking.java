package p1;

public class Booking {
    private int id;
    private String hotelName;
    private String guestName;
    private double totalCost;
    private String details;

    // Constructor (optional)
    public Booking(int id, String hotelName, String guestName, double totalCost, String details) {
        this.id = id;
        this.hotelName = hotelName;
        this.guestName = guestName;
        this.totalCost = totalCost;
        this.details = details;
    }

    public Booking() {
		// TODO Auto-generated constructor stub
	}

	// Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHotelName() {
        return hotelName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }

    public String getGuestName() {
        return guestName;
    }

    public void setGuestName(String guestName) {
        this.guestName = guestName;
    }

    public double getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(double totalCost) {
        this.totalCost = totalCost;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }
}
