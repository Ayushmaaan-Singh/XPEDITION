package p1;

public class CityDetails {
    private String cityName;
    private String cityDescription;
    private String base64Image;
    private String locationName;

    public CityDetails(String cityName, String cityDescription, String base64Image, String locationName) {
        this.cityName = cityName;
        this.cityDescription = cityDescription;
        this.base64Image = base64Image;
        this.locationName = locationName;
    }

    public String getCityName() {
        return cityName;
    }

    public String getCityDescription() {
        return cityDescription;
    }

    public String getBase64Image() {
        return base64Image;
    }

    public String getLocationName() {
        return locationName;
    }
}
