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
                <form action="Roomupload" method="post" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="Name" class="form-label">Room Name</label>
                        <input type="text" class="form-control" id="Name" name="Name" placeholder="Enter location name" required>
                    </div>
                    <div class="mb-3">
                        <label for="Descript" class="form-label">Description</label>
                        <input type="text" class="form-control" id="Descript" name="Descript" placeholder="Enter city name" required>
                    </div>
                    <div class="mb-3">
                        <label for="Price" class="form-label">Price</label>
                        <input type="text" class="form-control" id="Price" name="Price" placeholder="Enter city name" required>
                    </div>
                    <div class="mb-3">
                        <label for="image" class="form-label">Upload Image</label>
                        <input type="file" class="form-control" id="image" name="image" accept="image/*" required>
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
