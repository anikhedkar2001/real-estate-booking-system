<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <style>
    h1, h3 {
        text-align: center;
        text-transform: uppercase;
        color: darkgoldenrod;
    }
    
    .list-group{
    	margin-bottom: 2rem;
    }
    
    .list-group-item {
    	padding: 1.2rem 1.25rem;
    </style>
    
    <script>
    	function editField(type, id) {
        	var modalId = type + '-edit-modal-' + id;
        	$('#' + modalId).modal('show');
    	}
    	
        function editField(type, id) {
            $('#' + type + '-edit-modal-' + id).modal('show');
        }

        function cancelEdit(type, id) {
            $('#' + type + '-edit-modal-' + id).modal('hide');
        }

        function confirmDelete(type, id, name) {
            var deleteForm = document.getElementById(type + '-delete-form-' + id);
            if (confirm('Are you sure you want to delete ' + name + '?')) {
                deleteForm.submit();
            }
        }
    </script>
</head>
<body>

<div class="container mt-4">
    <h1 class="mb-5">Report Dashboard</h1>
    
    <!-- Section to display current data -->
    <div>
        <%
            Map<String, Object> data = (Map<String, Object>) request.getAttribute("data");
            if (data != null) {
                List<String> segments = (List<String>) data.get("segments");
                out.println("<h3>Edit/Delete Segments</h3>");
                if (segments != null) {
                    out.println("<div class='list-group'>");
                    for (String segment : segments) {
                        String segmentId = segment.replaceAll("\\s", "_");
                        out.println("<div class='list-group-item'>");
                        out.println("<span id='segment-display-" + segmentId + "'>" + segment + "</span>");
                        out.println("<div class='float-right'>");
                        out.println("<button class='btn btn-primary mr-2' onclick=\"editField('segment', '" + segmentId + "')\">Edit</button>");
                        out.println("<form id='segment-delete-form-" + segmentId + "' action='dashboard' method='post' class='d-inline'>");
                        out.println("<input type='hidden' name='action' value='deleteSegment'>");
                        out.println("<input type='hidden' name='keyid' value='" + data.get("KEYID") + "'>");
                        out.println("<input type='hidden' name='scope' value='" + data.get("SCOPE") + "'>");
                        out.println("<input type='hidden' name='segmentName' value='" + segment + "'>");
                        out.println("<button type='button' class='btn btn-danger' onclick=\"confirmDelete('segment', '" + segmentId + "', '" + segment + "')\">Delete</button>");
                        out.println("</form>");
                        out.println("</div>");
                        out.println("</div>");

                        // Edit Modal
                        out.println("<div class='modal fade' id='segment-edit-modal-" + segmentId + "' tabindex='-1' role='dialog' aria-labelledby='segmentEditModalLabel' aria-hidden='true'>");
                        out.println("<div class='modal-dialog' role='document'>");
                        out.println("<div class='modal-content'>");
                        out.println("<div class='modal-header'>");
                        out.println("<h5 class='modal-title' id='segmentEditModalLabel'>Edit Segment</h5>");
                        out.println("<button type='button' class='close' data-dismiss='modal' aria-label='Close'>");
                        out.println("<span aria-hidden='true'>&times;</span>");
                        out.println("</button>");
                        out.println("</div>");
                        out.println("<div class='modal-body'>");
                        out.println("<form action='dashboard' method='post'>");
                        out.println("<input type='hidden' name='action' value='updateSegment'>");
                        out.println("<input type='hidden' name='keyid' value='" + data.get("KEYID") + "'>");
                        out.println("<input type='hidden' name='scope' value='" + data.get("SCOPE") + "'>");
                        out.println("<input type='hidden' name='oldSegmentName' value='" + segment + "'>");
                        out.println("<div class='form-group'>");
                        out.println("<label for='newSegmentName'>New Segment Name</label>");
                        out.println("<input type='text' class='form-control' name='newSegmentName' value='" + segment + "' required>");
                        out.println("</div>");
                        out.println("<button type='submit' class='btn btn-success'>Save</button>");
                        out.println("<button type='button' class='btn btn-secondary' data-dismiss='modal'>Cancel</button>");
                        out.println("</form>");
                        out.println("</div>");
                        out.println("</div>");
                        out.println("</div>");
                        out.println("</div>");

                        // List Subsegments and add New Subsegment form
                        out.println("<div class='mt-4'>");
                        out.println("<h3>Subsegments for " + segment + "</h3>");
                        out.println("<div class='list-group'>");
                        List<Map<String, String>> subsegments = (List<Map<String, String>>) data.get("subsegments");
                        if (subsegments != null) {
                            for (Map<String, String> subsegment : subsegments) {
                                if (subsegment.get("SEGNAME").equals(segment)) {
                                    String subsegmentId = subsegment.get("SUBSEGNAME").replaceAll("\\s", "_");
                                    out.println("<div class='list-group-item'>");
                                    out.println("<span id='subsegment-display-" + subsegmentId + "'>" + subsegment.get("SUBSEGNAME") + "</span>");
                                    out.println("<div class='float-right'>");
                                    out.println("<button class='btn btn-primary mr-2' onclick=\"editField('subsegment', '" + subsegmentId + "')\">Edit</button>");
                                    out.println("<form id='subsegment-delete-form-" + subsegmentId + "' action='dashboard' method='post' class='d-inline'>");
                                    out.println("<input type='hidden' name='action' value='deleteSubsegment'>");
                                    out.println("<input type='hidden' name='keyid' value='" + data.get("KEYID") + "'>");
                                    out.println("<input type='hidden' name='scope' value='" + data.get("SCOPE") + "'>");
                                    out.println("<input type='hidden' name='segmentName' value='" + subsegment.get("SEGNAME") + "'>");
                                    out.println("<input type='hidden' name='subsegmentName' value='" + subsegment.get("SUBSEGNAME") + "'>");
                                    out.println("<button type='button' class='btn btn-danger' onclick=\"confirmDelete('subsegment', '" + subsegmentId + "', '" + subsegment.get("SUBSEGNAME") + "')\">Delete</button>");
                                    out.println("</form>");
                                    out.println("</div>");
                                    out.println("</div>");

                                    // Edit Modal
                                    out.println("<div class='modal fade' id='subsegment-edit-modal-" + subsegmentId + "' tabindex='-1' role='dialog' aria-labelledby='subsegmentEditModalLabel' aria-hidden='true'>");
                                    out.println("<div class='modal-dialog' role='document'>");
                                    out.println("<div class='modal-content'>");
                                    out.println("<div class='modal-header'>");
                                    out.println("<h5 class='modal-title' id='subsegmentEditModalLabel'>Edit Subsegment</h5>");
                                    out.println("<button type='button' class='close' data-dismiss='modal' aria-label='Close'>");
                                    out.println("<span aria-hidden='true'>&times;</span>");
                                    out.println("</button>");
                                    out.println("</div>");
                                    out.println("<div class='modal-body'>");
                                    out.println("<form action='dashboard' method='post'>");
                                    out.println("<input type='hidden' name='action' value='updateSubsegment'>");
                                    out.println("<input type='hidden' name='keyid' value='" + data.get("KEYID") + "'>");
                                    out.println("<input type='hidden' name='scope' value='" + data.get("SCOPE") + "'>");
                                    out.println("<input type='hidden' name='segmentName' value='" + subsegment.get("SEGNAME") + "'>");
                                    out.println("<input type='hidden' name='oldSubsegmentName' value='" + subsegment.get("SUBSEGNAME") + "'>");
                                    out.println("<div class='form-group'>");
                                    out.println("<label for='newSubsegmentName'>New Subsegment Name</label>");
                                    out.println("<input type='text' class='form-control' name='newSubsegmentName' value='" + subsegment.get("SUBSEGNAME") + "' required>");
                                    out.println("</div>");
                                    out.println("<button type='submit' class='btn btn-success'>Save</button>");
                                    out.println("<button type='button' class='btn btn-secondary' data-dismiss='modal'>Cancel</button>");
                                    out.println("</form>");
                                    out.println("</div>");
                                    out.println("</div>");
                                    out.println("</div>");
                                    out.println("</div>");
                                }
                            }
                        }

                        // Add New Subsegment Form
                        out.println("<div class='mt-3'>");
                        out.println("<h5>Add New Subsegment</h5>");
                        out.println("<form action='dashboard' method='post'>");
                        out.println("<input type='hidden' name='action' value='createSubsegment'>");
                        out.println("<input type='hidden' name='keyid' value='" + data.get("KEYID") + "'>");
                        out.println("<input type='hidden' name='scope' value='" + data.get("SCOPE") + "'>");
                        out.println("<input type='hidden' name='segmentName' value='" + segment + "'>");
                        out.println("<div class='form-group'>");
                        out.println("<input type='text' class='form-control' name='subsegmentName' placeholder='New Subsegment Name' required>");
                        out.println("</div>");
                        out.println("<button type='submit' class='btn btn-primary'>Add</button>");
                        out.println("</form>");
                        out.println("</div>");
                        out.println("</div>");
                    }
                    out.println("</div>");
                }
            } else {
                out.println("<p>No data available</p>");
            }
        %>
    </div>
    
    <!-- Section to add new entities -->
    <div class="mt-4">
        <button onclick="location.href='addSegment.jsp';" class="btn btn-primary">Insert New Segment</button>
    </div>

    <!-- Edit Company Modal Section -->
    <div class="mt-4">
    <h3>Companies</h3>
    <%
        List<String> companies = (List<String>) data.get("companies");
        if (companies != null) {
            out.println("<div class='list-group'>");
            for (String company : companies) {
                String companyId = company.replaceAll("\\s", "_").replaceAll("[^a-zA-Z0-9_]", "");
                out.println("<div class='list-group-item'>");
                out.println("<span id='company-display-" + companyId + "'>" + company + "</span>");
                out.println("<div class='float-right'>");
                out.println("<button class='btn btn-primary mr-2' onclick=\"editField('company', '" + companyId + "')\">Edit</button>");
                out.println("<form id='company-delete-form-" + companyId + "' action='dashboard' method='post' class='d-inline'>");
                out.println("<input type='hidden' name='action' value='deleteCompany'>");
                out.println("<input type='hidden' name='keyid' value='" + data.get("KEYID") + "'>");
                out.println("<input type='hidden' name='scope' value='" + data.get("SCOPE") + "'>");
                out.println("<input type='hidden' name='companyName' value='" + company + "'>");
                out.println("<button type='button' class='btn btn-danger' onclick=\"confirmDelete('company', '" + companyId + "', '" + company + "')\">Delete</button>");
                out.println("</form>");
                out.println("</div>");
                out.println("</div>");

                // Edit Modal
                out.println("<div class='modal fade' id='company-edit-modal-" + companyId + "' tabindex='-1' role='dialog' aria-labelledby='companyEditModalLabel' aria-hidden='true'>");
                out.println("<div class='modal-dialog' role='document'>");
                out.println("<div class='modal-content'>");
                out.println("<div class='modal-header'>");
                out.println("<h5 class='modal-title' id='companyEditModalLabel'>Edit Company</h5>");
                out.println("<button type='button' class='close' data-dismiss='modal' aria-label='Close'>");
                out.println("<span aria-hidden='true'>&times;</span>");
                out.println("</button>");
                out.println("</div>");
                out.println("<div class='modal-body'>");
                out.println("<form action='dashboard' method='post'>");
                out.println("<input type='hidden' name='action' value='updateCompany'>");
                out.println("<input type='hidden' name='keyid' value='" + data.get("KEYID") + "'>");
                out.println("<input type='hidden' name='scope' value='" + data.get("SCOPE") + "'>");
                out.println("<input type='hidden' name='oldCompanyName' value='" + company + "'>");
                out.println("<div class='form-group'>");
                out.println("<label for='newCompanyName'>New Company Name</label>");
                out.println("<input type='text' class='form-control' name='newCompanyName' value='" + company + "' required>");
                out.println("</div>");
                out.println("<button type='submit' class='btn btn-success'>Save</button>");
                out.println("<button type='button' class='btn btn-secondary' data-dismiss='modal'>Cancel</button>");
                out.println("</form>");
                out.println("</div>");
                out.println("</div>");
                out.println("</div>");
                out.println("</div>");
            }
            out.println("</div>");
        } else {
            out.println("<p>No companies available</p>");
        }
    %>
</div>

<div class='mt-3'>
    <h5>Add New Company</h5>
    <form action='dashboard' method='post'>
        <input type='hidden' name='action' value='createCompany'>
        <input type='hidden' name='keyid' value='<%= data.get("KEYID") %>'>
        <input type='hidden' name='scope' value='<%= data.get("SCOPE") %>'>
        <div class='form-group'>
            <input type='text' class='form-control' name='companyName' placeholder='New Company Name' required>
        </div>
        <button type='submit' class='btn btn-primary'>Add</button>
    </form>
</div>

<script>
    function editField(type, id) {
        var modalId = type + '-edit-modal-' + id;
        $('#' + modalId).modal('show');
    }
</script>
    
</div>

</body>
</html>
