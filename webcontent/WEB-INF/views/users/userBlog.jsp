<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="activePage" value="blogs" />
<c:set var="css_links" value="${['assets/css/blogs.css']}" />

<%@include file="/WEB-INF/comps/dashboard/header.jsp" %>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
          <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
              <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
          </symbol>
          <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
             <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
          </symbol>
          <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
              <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
          </symbol>
        </svg>
        <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Warning:"><use xlink:href="#exclamation-triangle-fill"/></svg>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         Are you sure you want to delete this comment?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
       
         <button type="button" class="btn btn-danger" id="confirmDeleteButton" data-blog-id="">Yes</button>
      
      </div>
    </div>
  </div>
</div>
<div class="containter" style="padding: 0 10em;">
    <section class="page-title centred p-0 m-3">

        <div class="auto-container">
            <div class="content-box">
                <h1>Personal Blogs</h1>
                <ul class="bread-crumb clearfix">
                    <li><a href="/DiagnosticAI/index.jsp">Profile</a></li>
                    <li>Manage Blogs </li><br>
                    <li>
                        <a class="btn-box theme-btn m-3" data-bs-toggle="modal" data-bs-target="#partInfoModal1"
                            href="publish" role="button">
                            Publish
                        </a>
    
                    </li>
                </ul>
    
    
            </div>
        </div>
    </section>
        
    <div class="pagination-wrapper centred m-3">
        <ul class="pagination clearfix">
            <c:forEach begin="1" end="${totalPages}" var="page">
                <li>
                    <c:if test="${page == currentPage}">
                        <a href="manage_blog?page=${page}" class="active">${page}</a>
                    </c:if>
                    <c:if test="${page != currentPage}">
                        <a href="manage_blog?page=${page}">${page}</a>
                    </c:if>
                </li>
            </c:forEach>
        </ul>
    </div>

    <table class="table table-striped table-centered mb-3 border shadow-sm">
        <thead>
            <tr>
                <th>Picture</th>
                <th>Title</th>
                <th>Created Date</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="blog" items="${blogs}">
                <tr>
                    <td class="table-user">
                        <img src="${blog.getImage()}" alt="table-user" class="me-1" style="border-radius: 50%; width: 75px; height: 75px; object-fit: cover; object-position: center;" />
    
                    </td>
                    <td> ${blog.getTitle()}</td>
                    <td>${blog.getDate().toString()} </td>
                    <td class="table-action">
                        <a href="#" class="action-icon theme-btn-icon mr-3" data-toggle="modal" data-target="#exampleModal" onclick="openModalWithData(${blog.getID()})">
                            <i class="fas fa-trash"></i>
                        </a>
                        <a href="update_blog?id=${blog.getID()}" class="action-icon theme-btn-icon">
                            <i class="fas fa-edit"></i>
                        </a>
                      
                    </td>
                </tr>
            </c:forEach>
    
        </tbody>
    </table>

</div>
<script>
function openModalWithData(data) {
    // Set the data-blog-id attribute
    document.getElementById('confirmDeleteButton').setAttribute('data-blog-id', data);

    // Open the modal
    $('#exampleModal').modal('show');
}

// Add an event listener to the confirmation button
document.getElementById('confirmDeleteButton').addEventListener('click', function() {
    // Retrieve the data-blog-id attribute value
    var blogId = this.getAttribute('data-blog-id');

    // Perform your action here, for example, redirecting to remove_blog
    window.location.href = 'remove_blog?blog_id=' + blogId;
});
</script>



        
<%@include file="/WEB-INF/comps/dashboard/footer.jsp" %>