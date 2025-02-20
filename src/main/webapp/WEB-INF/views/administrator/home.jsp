<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>Admin Home</title>
    
   	<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    

	<jsp:include page="/WEB-INF/views/administrator/layout/css.jsp"></jsp:include>
	<link href="dashboard.css" rel="stylesheet">
	
	<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    
  </head>
<body>
	<jsp:include page="/WEB-INF/views/administrator/layout/header.jsp"></jsp:include>


	<div class="container-fluid">
	  <div class="row">
	    <jsp:include page="/WEB-INF/views/administrator/layout/nav.jsp"></jsp:include>
	
	    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
	        <h1 class="h2">Dashboard</h1>
	        <div class="btn-toolbar mb-2 mb-md-0">
	          <div class="btn-group me-2">
	            <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
	            <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
	          </div>
	          <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
	            <span data-feather="calendar"></span>
	            This week
	          </button>
	        </div>
	      </div>
	
	      <canvas class="my-4 w-100 chartjs-render-monitor" id="myChart" width="1523" height="642" style="display: block; height: 514px; width: 1219px;"></canvas>
	
	      <h2>Section title</h2>
	      <div class="table-responsive">
	        <table class="table table-striped table-sm">
	          <thead>
	            <tr>
	              <th scope="col">#</th>
	              <th scope="col">Header</th>
	              <th scope="col">Header</th>
	              <th scope="col">Header</th>
	              <th scope="col">Header</th>
	            </tr>
	          </thead>
	          <tbody>
	            <tr>
	              <td>1,001</td>
	              <td>random</td>
	              <td>data</td>
	              <td>placeholder</td>
	              <td>text</td>
	            </tr>
	            <tr>
	              <td>1,002</td>
	              <td>placeholder</td>
	              <td>irrelevant</td>
	              <td>visual</td>
	              <td>layout</td>
	            </tr>
	            <tr>
	              <td>1,003</td>
	              <td>data</td>
	              <td>rich</td>
	              <td>dashboard</td>
	              <td>tabular</td>
	            </tr>
	            <tr>
	              <td>1,003</td>
	              <td>information</td>
	              <td>placeholder</td>
	              <td>illustrative</td>
	              <td>data</td>
	            </tr>
	            <tr>
	              <td>1,004</td>
	              <td>text</td>
	              <td>random</td>
	              <td>layout</td>
	              <td>dashboard</td>
	            </tr>
	            <tr>
	              <td>1,005</td>
	              <td>dashboard</td>
	              <td>irrelevant</td>
	              <td>text</td>
	              <td>placeholder</td>
	            </tr>
	            <tr>
	              <td>1,006</td>
	              <td>dashboard</td>
	              <td>illustrative</td>
	              <td>rich</td>
	              <td>data</td>
	            </tr>
	            <tr>
	              <td>1,007</td>
	              <td>placeholder</td>
	              <td>tabular</td>
	              <td>information</td>
	              <td>irrelevant</td>
	            </tr>
	            <tr>
	              <td>1,008</td>
	              <td>random</td>
	              <td>data</td>
	              <td>placeholder</td>
	              <td>text</td>
	            </tr>
	            <tr>
	              <td>1,009</td>
	              <td>placeholder</td>
	              <td>irrelevant</td>
	              <td>visual</td>
	              <td>layout</td>
	            </tr>
	            <tr>
	              <td>1,010</td>
	              <td>data</td>
	              <td>rich</td>
	              <td>dashboard</td>
	              <td>tabular</td>
	            </tr>
	            <tr>
	              <td>1,011</td>
	              <td>information</td>
	              <td>placeholder</td>
	              <td>illustrative</td>
	              <td>data</td>
	            </tr>
	            <tr>
	              <td>1,012</td>
	              <td>text</td>
	              <td>placeholder</td>
	              <td>layout</td>
	              <td>dashboard</td>
	            </tr>
	            <tr>
	              <td>1,013</td>
	              <td>dashboard</td>
	              <td>irrelevant</td>
	              <td>text</td>
	              <td>visual</td>
	            </tr>
	            <tr>
	              <td>1,014</td>
	              <td>dashboard</td>
	              <td>illustrative</td>
	              <td>rich</td>
	              <td>data</td>
	            </tr>
	            <tr>
	              <td>1,015</td>
	              <td>random</td>
	              <td>tabular</td>
	              <td>information</td>
	              <td>text</td>
	            </tr>
	          </tbody>
	        </table>
	      </div>
	    </main>
	  </div>
	</div>
	
	
	 <jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
</body>
</html>
