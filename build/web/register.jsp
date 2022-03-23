<%-- 
    Document   : register
    Created on : Mar 21, 2022, 3:49:21 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Yanone+Kaffeesatz:wght@700&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>JSP Page</title>
        <style>
            *{
                font-family: 'Yanone Kaffeesatz', sans-serif;
            }
            .main_contain{
                height: 100vh;
                width: 100vw;
                background: whitesmoke;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            
            .main_contain .form{
                background: white;
                padding: 20px;
                width: 400px;
                border: 1px solid #e0e0e0;
            }
        </style>
    </head>
    <body>
        
        <div class="main_contain">
            
            <div class="form">
            
                <form action="<%= request.getContextPath() %>/register" method="post">
                    <h3 class="text-center mb-4">Registration form</h3>

                    <div class="mb-3">
                        <label class="form-label">First Name </label>
                        <input type="text" class="form-control" placeholder="Enter Username" name="firtsname"/>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Last Name</label>
                        <input type="text" class="form-control" placeholder="Enter Lastname"  name="lastname"/>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" class="form-control" placeholder="Enter Email" name="email" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password" class="form-control" placeholder="" name="password" />
                    </div>
                    
                    <input type="submit" class="btn btn-primary w-100" value="register" />
                    
                </form>
                
            </div>
            
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
