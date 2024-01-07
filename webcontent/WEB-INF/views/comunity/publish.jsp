<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="css_links" value="${['assets/css/form-page.css']}" />
<style>
    button.browse.btn.px-4 {
        color: #fff;
        background-color: var(--main-color);
        border-color: var(--main-color);
    }

    input#title {
        width: 411px;
        margin-left: 12px;
    }
    .ql-toolbar {
    max-width: 411px; /* Set your desired max-width */
    margin-left: 12px;
     /* Center the toolbar */
}

     #description {
            height: 130px;
              width: 411px;
        margin-left: 12px;
        }
        /* Style for the file input */
.input-file-container {
  position: relative;
  width: 100%;
  margin: 20px 0;
}

.input-file {
  opacity: 0;
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  cursor: pointer;
}

.input-file-label {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 60px;
  padding: 10px;
  background-color: #3498db;
  color: #fff;
  border-radius: 5px;
  font-family: 'Arial', sans-serif;
  font-size: 16px;
  font-weight: bold;
  cursor: pointer;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.input-file-label:hover {
  background-color: #2980b9;
}

.input-file-label:active {
  background-color: #1f679b;
}

/* Style for the file name display */
.file-name {
  margin-left: 10px;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
  flex-grow: 1;
}

/* Style for the upload button */
.upload-button {
  margin-top: 10px;
  padding: 10px;
  background-color: #2ecc71;
  color: #fff;
  border: none;
  border-radius: 5px;
  font-family: 'Arial', sans-serif;
  font-size: 16px;
  font-weight: bold;
  cursor: pointer;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.upload-button:hover {
  background-color: #27ae60;
}

.upload-button:active {
  background-color: #1f8c4b;
}
        
         
</style>
 <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">


    <!-- Your other stylesheets and scripts... -->

    <!-- Quill Library -->
    <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>

    <!-- Your other scripts... -->

    <!-- Quill Initialization Script -->
    <script>
    document.addEventListener('DOMContentLoaded', function () {
        var quill = new Quill('#description', {
            modules: {
                toolbar: [
                    ['bold', 'italic'],
                    ['link', 'blockquote', 'code-block'],
                    [{ list: 'ordered' }, { list: 'bullet' }]
                ]
            },
            placeholder: 'Type your Content',
            theme: 'snow'
        });
    });
</script>

       
<%@include file="/WEB-INF/comps/header.jsp" %>

<div class="app-form-cnt container">

  <div class="text-center mb-3">
    <h1 class="h3">
    <div>
        <img width="100" height="100" src="assets/images/logo.png" class="logo" alt="Logo">
        </div>
    
        <c:if test="${empty blog}"> Publish Blog </c:if>
        <c:if test="${not empty blog}"> Update Blog </c:if>
    </h1>
    <c:if test="${not empty form_error}">
        <div class="alert alert-danger" role="alert">
            <p class="text-sm text-danger">${form_error}</p>
        </div>
    </c:if>
</div>
  

	<form action="" method="POST" enctype="multipart/form-data">
        <div class="mb-3">
				<div class="container">
						<input  name="image" type="file" class="form-control" id="image" placeholder="Image" accept="image/*">
				
			
			
	
</div>
			
		</div>
		<div class="mb-3">
		
			<input <c:if test="${not empty blog}"> value="${blog.getTitle()}" </c:if> name="title" type="text" class="form-control control-lg" id="title" placeholder="Title" class="form-control form-control-lg inp " 
                >
			
		</div>
		<div class="mb-3">
             <textarea rows="5" name="description" class="form-control" id="description" placeholder="Description"><c:if test="${not empty blog}">${blog.getDescription()}</c:if></textarea>

		 
		</div>
		
	
		<div class="d-flex justify-content-center"> <!-- Center the button -->
            <button class="btn-box theme-btn" data-bs-toggle="modal" data-bs-target="#partInfoModal1" type="submit">
                Publish
            </button>
        </div>
	</form>
	
</div>

<%@include file="/WEB-INF/comps/footer.jsp" %>