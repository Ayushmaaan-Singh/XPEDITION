<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Form</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="card shadow-sm">
            <div class="card-header bg-primary text-white">
                <h3 class="mb-0">Upload Form</h3>
            </div>
            <div class="card-body">
                <form action="hotelupload" method="post" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="LocName" class="form-label">Hotel Name</label>
                        <input type="text" class="form-control" id="LocName" name="HotName" placeholder="Enter hotel name" required>
                    </div>
                    <div class="mb-3">
                        <label for="CityName" class="form-label">Hotel Address</label>
                        <input type="text" class="form-control" id="CityName" name="HotAdd" placeholder="Enter hotel address" required>
                    </div>
                    <div class="mb-3">
                        <label for="img" class="form-label">Upload Hotel Image</label>
                        <input type="file" class="form-control" id="img" name="img" accept="image/*" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Submit</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>