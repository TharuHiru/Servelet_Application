<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link rel="stylesheet" href="Styles/viewPage.css?">

<html>
<head>
    <title>Student Data</title>
</head>
<body>
<div class="main_topic">
    <h1>Student Management</h1>
    <a href="index.jsp" id="back" class="button">BACK</a>
</div>
<div class="flex-container">

    <!-- Container for the Student Data Table -->
    <div class="table-container">
            <div class="search-container">
                        <input type="text" name="searchTxt" id="searchTxt" placeholder="Search " oninput="filterTable()"/>
                        <select id="genderFilter" onchange="filterTable()" >
                            <option value="" disabled selected>Gender</option>
                            <option value="">All</option>
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                        </select>

                        <select id="mediumFilter" onchange="filterTable()" placeholder = "Medium">
                            <option value="" disabled selected>Medium</option>
                            <option value="">All</option>
                            <option value="Sinhala">Sinhala</option>
                            <option value="English">English</option>
                        </select>
            </div>

        <table id = "studentDetail">
            <tr>
                <th></th>
                <th>ID</th>
                <th>Name</th>
                <th>Gender</th>
                <th>Date of Birth</th>
                <th>Year</th>
                <th>Address</th>
                <th>Medium</th>
                <th>Email</th>
                <th>Phone Number</th>
                <th>Grade</th>
            </tr>

            <%
                List<HashMap<String, String>> studentList = (List<HashMap<String, String>>) request.getAttribute("studentList");
                if (studentList != null && !studentList.isEmpty()) {
                    for (HashMap<String, String> student : studentList) {
            %>
            <tr>
                <td>
                    <a href="UpdateAndDelete_servlet?action=view&id=<%= student.get("id") %>">
                        <i class="fa fa-eye" style="color: darkslategray;"></i>
                    </a>
                </td>
                <td><%= student.getOrDefault("id", "") %></td>
                <td><%= student.getOrDefault("name", "") %></td>
                <td><%= student.getOrDefault("gender", "") %></td>
                <td><%= student.getOrDefault("dateOfBirth", "") %></td>
                <td><%= student.getOrDefault("year", "") %></td>
                <td><%= student.getOrDefault("address", "") %></td>
                <td><%= student.getOrDefault("medium", "") %></td>
                <td><%= student.getOrDefault("email", "") %></td>
                <td><%= student.getOrDefault("phoneNumber", "") %></td>
                <td><%= student.getOrDefault("grade", "") %></td>

            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="11">No data available</td>
            </tr>
            <%
                }
            %>
        </table>
    </div>

    <!-- Container for the Student Form -->
    <div class="form-container">
        <h2>View Student</h2>
        <hr>
        <br>
        <%
            HashMap<String, String> selectedStudent = (HashMap<String, String>) request.getAttribute("selectedStudent");
        %>
        <form action="UpdateAndDelete_servlet" method="post">
            <input type="hidden" name="action" value="Update">
            <label for="id">Student ID</label>
            <input type="text" id="id" name="id" value="<%= selectedStudent != null ? selectedStudent.get("id") : "" %>" required readonly/>

            <label for="name">Name</label>
            <input type="text" id="name" name="name" value="<%= selectedStudent != null ? selectedStudent.get("name") : "" %>" required/>

            <label>Gender:</label>
            <div class="gender-input">
                <label for="male">Male</label>
                <input type="radio" id="male" name="gender" value="male" <%= selectedStudent != null && "male".equals(selectedStudent.get("gender")) ? "checked" : "" %>/>
                <label for="female">Female</label>
                <input type="radio" id="female" name="gender" value="female" <%= selectedStudent != null && "female".equals(selectedStudent.get("gender")) ? "checked" : "" %>/>
            </div>

            <label for="dateOfBirth">Date of Birth</label>
            <input type="date" id="dateOfBirth" name="dateOfBirth" value="<%= selectedStudent != null ? selectedStudent.get("dateOfBirth") : "" %>" required/>

            <label for="year">Enrolled Year</label>
            <select id="year" name="year" required>
                <option value="">Select Year</option>
                <option value="2018" <%= selectedStudent != null && "2018".equals(selectedStudent.get("year")) ? "selected" : "" %>>2018</option>
                <option value="2019" <%= selectedStudent != null && "2019".equals(selectedStudent.get("year")) ? "selected" : "" %>>2019</option>
                <option value="2020" <%= selectedStudent != null && "2020".equals(selectedStudent.get("year")) ? "selected" : "" %>>2020</option>
                <option value="2021" <%= selectedStudent != null && "2021".equals(selectedStudent.get("year")) ? "selected" : "" %>>2021</option>
                <option value="2022" <%= selectedStudent != null && "2022".equals(selectedStudent.get("year")) ? "selected" : "" %>>2022</option>
                <option value="2023" <%= selectedStudent != null && "2023".equals(selectedStudent.get("year")) ? "selected" : "" %>>2023</option>
            </select>

            <label for="address">Address</label>
            <input type="text" id="address" name="address" value="<%= selectedStudent != null ? selectedStudent.get("address") : "" %>" required/>

            <label for="medium">Learning Medium</label>
            <select id="medium" name="medium" required>
                <option value="">Select Medium</option>
                <option value="Sinhala" <%= selectedStudent != null && "Sinhala".equals(selectedStudent.get("medium")) ? "selected" : "" %>>Sinhala</option>
                <option value="English" <%= selectedStudent != null && "English".equals(selectedStudent.get("medium")) ? "selected" : "" %>>English</option>
            </select>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" value="<%= selectedStudent != null ? selectedStudent.get("email") : "" %>" required/>

            <label for="phoneNumber">Phone Number</label>
            <input type="number" id="phoneNumber" name="phoneNumber" value="<%= selectedStudent != null ? selectedStudent.get("phoneNumber") : "" %>" required/>

            <label for="grade">Grade</label>
            <input type="text" id="grade" name="grade" value="<%= selectedStudent != null ? selectedStudent.get("grade") : "" %>" required/>

<div id = "buttons">
            <input type="submit" value="Update" />
            <a href="UpdateAndDelete_servlet?action=delete&id=<%= selectedStudent != null ? selectedStudent.get("id") : "" %>" class="delete-button">Delete</a>
</div>

        </form>
    </div>

</div>

<script>
    function filterTable() {
        var input, filter, genderFilter, mediumFilter, table, tr, td, i, txtValue;

        // Get the search text and convert it to uppercase for case-insensitive comparison
        input = document.getElementById("searchTxt");
        filter = input.value.toUpperCase();

        // Get selected gender and medium filter values
        genderFilter = document.getElementById("genderFilter").value.toUpperCase();
        mediumFilter = document.getElementById("mediumFilter").value.toUpperCase();

        // Get the table and rows
        table = document.getElementById("studentDetail");
        tr = table.getElementsByTagName("tr");

        // Loop through all table rows (skip the header row)
        for (i = 1; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td");
            if (td) {
                // Get values from columns: ID, Name, Address, Email, Phone Number, Gender, Medium
                var id = td[1].textContent || td[1].innerText;
                var name = td[2].textContent || td[2].innerText;
                var address = td[6].textContent || td[6].innerText;
                var email = td[8].textContent || td[8].innerText;
                var phone = td[9].textContent || td[9].innerText;
                var gender = td[3].textContent || td[3].innerText;
                var medium = td[7].textContent || td[7].innerText;

                // Check if the row matches the search criteria and filter conditions
                var matchesSearch =
                    id.toUpperCase().indexOf(filter) > -1 ||
                    name.toUpperCase().indexOf(filter) > -1 ||
                    address.toUpperCase().indexOf(filter) > -1 ||
                    email.toUpperCase().indexOf(filter) > -1 ||
                    phone.toUpperCase().indexOf(filter) > -1;

                var matchesGender = genderFilter === "" || gender.toUpperCase() === genderFilter;
                var matchesMedium = mediumFilter === "" || medium.toUpperCase() === mediumFilter;

                // Show the row if it matches search and filter conditions, else hide it
                if (matchesSearch && matchesGender && matchesMedium) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }

</script>
</body>
</html>
