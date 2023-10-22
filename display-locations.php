<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Looking for Backpacking...</title>

    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
</head>
<body>
    <p>WELCOME BACKPACKER!</p>
    <div id="map" style="height: 800px;"></div>

    <script>
        const apiKey = "ead50ecb-d210-43ef-a215-3adc3370c1aa";
        const apiUrl = "https://ridb.recreation.gov/api/v1/facilities";

        const activity = "BACKPACKING";
        const stateInitials = "<?php echo $_GET['stateInitials']; ?>";
        const maxDistance = "<?php echo $_GET['maxDistance']; ?>";
        const userLatitude = <?php echo $_GET['latitude']; ?>;
        const userLongitude = <?php echo $_GET['longitude']; ?>;

        // centered on user (maybe make a marker for current location)
        const map = L.map('map').setView([userLatitude, userLongitude], 10);

        if(userLatitude != null && userLongitude != null) 
            L.marker([userLongitude, userLatitude])
                .addTo(map)
                .bindPopup('Your Location');

        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '© <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
        }).addTo(map);

        
        
        async function fetchFacilities() {
            try {
                const response = await fetch(`${apiUrl}?apikey=${apiKey}&state=${stateInitials}&activity=${activity}`);
                const data = await response.json();

                if (data.RECDATA) {
                    const facilities = data.RECDATA;
                    facilities.forEach(facility => {
                        const facilityLatitude = parseFloat(facility.FacilityLatitude);
                        const facilityLongitude = parseFloat(facility.FacilityLongitude);

                        L.marker([facilityLatitude, facilityLongitude])
                            .addTo(map)
                            .bindPopup(`Name: ${facility.FacilityName}, Latitude: ${facilityLatitude}, Longitude: ${facilityLongitude}`);
                    });
                }
            } catch (error) {
                console.error("Error fetching data: " + error);
            }
        }

        fetchFacilities();
    </script>
</body>
</html>