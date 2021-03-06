<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/Other/html.html to edit this template
-->
<html xmlns:th="http://www.thymeleaf.org">
    <head>
        <title><i class="bi bi-gear"></i> Development ...</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <div style="width: 100%; height: auto; margin: 0 auto; align-content: center; text-align: center;">
            <span>Cadastro de cidades e estados</span>
        </div>
        
        <div class="card">
            <h5 class="card-header">Gerenciamento de cidades</h5>
            <div class="card-body">
                <a href="#"><h5>Home</h5></a>
                
                <hr/><br/>
                
                <form action="/insert/cidade" method="POST">
                    <div class="form-group">
                        <label for="name">Cidade:</label>
                        <input type="text" name="name" placeholder="informe o nome da cidade" id="name" value="">
                    </div>
                    <#if nameError??>
                        <label>${nameErrorMessage}</label>
                    </#if>

                    <div class="form-group">
                        <label for="state">Estado:</label>
                        <input type="text" name="state" placeholder="informe o estado" id="state" value="">
                    </div>

                    <#--  <input type="hidden" id="id_cidade" name="id_cidade" value=""/>  -->
                    <input type="hidden" id="id" name="id" value="0"/>
                    <input type="hidden" id="nameEx" name="nameEx" value=""/>

                    <button type="submit">enviar</button>
                </form>

                <hr/>

                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">code</th>
                            <th scope="col">Actions</th>
                            <th scope="col">Nome</th>
                            <th scope="col">Estado</th>
                        </tr>
                    </thead>

                    <!-- example -->
                    <tbody>
                    <#if hashMapPageVariables??>
                    <#assign listaCidadess=hashMapPageVariables>
                    <#assign keysListCidade=listaCidadess?keys>
                    <#list keysListCidade as key> 
                        <#if key == "listaCidades">
                        <#list listaCidadess[key] as cidade> 
                        <tr>
                            <td id="idCity">${cidade.id}</td>
                            <td>
                                <button type="button" class="btn btn-danger btn-sm">
                                    <a href="/del/cidade?name=${cidade.name}&state=${cidade.state}">del</a>
                                </button><!-- comment -->

                                <button type="button" class="btn btn-warning btn-sm" onclick="clickUpdate(this, `${cidade.name}`, `${cidade.state}`, `${cidade.id}`)">
                                    <a href="#">alterar</a>
                                </button>
                            </td>
                            <td id="nameCity">${cidade.name}</td>
                            <td id="nameState">${cidade.state}</td>
                        </tr>
                        </#list>
                        </#if>
                    </#list>
                    </#if>
                    </tbody>
                </table>
            </div>
            <!-- card body -->           
        </div>
        <!-- card -->   
        
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <script>
            function clickUpdate(element, name, state, id)
            {
                console.log("Alterar cidade ...");
                console.log("Mostrando element html clicked ... \n"+element);
                console.log("Attributes ... \n"+document.getElementById("idCity").attributes);
                console.log("TextContent ... \n"+document.getElementById("idCity").textContent);

                document.getElementById("id").value = id;
                document.getElementById("name").value = name;
                document.getElementById("state").value = state;
            }
        </script>
    </body>
</html>
