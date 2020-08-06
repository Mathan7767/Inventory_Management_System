          document.getElementById("addProduct").addEventListener("click", function()
          {
            document.getElementById("popup").style.display = "flex";
            document.getElementById("pane").style.display = "none";
            
          })

          document.getElementById("close").addEventListener("click", function()
          {
            document.getElementById("popup").style.display = "none";
            document.getElementById("pane").style.display = "flex";
          })
