
   </div>
   <script src="../assets/table_enter.js"></script>
      <!-- export to excel -->
      <script src="../assets/xlsx.full.min.js"></script>
   <script src="../assets/export.js"></script>
  
   <!-- Required Jqurey -->
  
   <script src="../assets/plugins/jquery-ui/jquery-ui.min.js"></script>
   <script src="../assets/plugins/tether/dist/js/tether.min.js"></script>

   <!-- Required Fremwork -->
   <script src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
   <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
   <!-- <script src="https://azukcdncp.azureedge.net/contents/js/bootstrap?v=4.1"></script> -->

   <!-- waves effects.js -->
   <script src="../assets/plugins/Waves/waves.min.js"></script>

   <!-- Scrollbar JS-->
   <script src="../assets/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>
   <script src="../assets/plugins/jquery.nicescroll/jquery.nicescroll.min.js"></script>

   <!--classic JS-->
   <script src="../assets/plugins/classie/classie.js"></script>

 
   <!-- custom js -->
   <script type="text/javascript" src="../assets/js/main.min.js"></script>

   <script src="../assets/notification.js"></script>
   <script type="text/javascript" src="../assets/pages/elements.js"></script>
   <script src="../assets/js/menu.min.js"></script>

   <!-- data table -->
   <script src="../assets/jquery.dataTables.min.js"></script>
   <script src="../assets/dataTables.bootstrap5.min.js"></script>

   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>


    <script>
    $(document).ready(function () {

        // -------------------------------------------
        // 1. INPUT VALIDATION (numbers, /, -, . only)
        // -------------------------------------------
        $(document).on("input", ".date_input", function () {
            this.value = this.value.replace(/[^0-9\/\-.]/g, "");
        });

        // -------------------------------------------
        // 2. DATE PICKER + PRELOAD SELECTED DATE
        // -------------------------------------------
        $('.date_input').each(function () {

            let val = $(this).val().trim();

            // Initialize Date Picker
            $(this).datepicker({
                format: 'dd/mm/yyyy',
                autoclose: true,
                todayHighlight: true,
                orientation: "bottom"
            });

            // If a pre-filled dd/mm/yyyy date exists → set it
            if (val !== '' && val.includes("/")) {
                let p = val.split('/');
                if (p.length === 3) {
                    $(this).datepicker('setDate', new Date(p[2], p[1] - 1, p[0]));
                }
            }

        });

    });


    /*-----------------------------------------
  MYSQL -> DMY FORMATTER
------------------------------------------*/


    function formatDMY(d) {
    if (!d) return '';
    let x = new Date(d);
    return x.toLocaleDateString('en-GB'); // dd-mm-yyyy
    }
    </script>





 



   <script>
   
    $(document).ready(function() {
    $('#search_client').select2();
  });
</script>
  
        
        <script>
        
            $(document).ready(function() {
            $('#search_client').select2();
        });
    </script>
   

<script>
  document.getElementById('my-form').addEventListener('submit', function(event) {
    const form = this;

    // Validate form
    if (!form.checkValidity()) {
      event.preventDefault();
      event.stopPropagation();
      form.classList.add('was-validated');
      return;
    }

    // Get the submit button by class
    const button = form.querySelector('button.processing');
    if (button) {
      button.disabled = true;
      button.innerHTML = 'Please wait <i class="fa fa-gear fa-spin" style="font-size:24px"></i>';
    }
 
  });
</script>

 <script>
  document.getElementById('my-form1').addEventListener('submit', function(event) {
    const form = this;

    // Validate form
    if (!form.checkValidity()) {
      event.preventDefault();
      event.stopPropagation();
      form.classList.add('was-validated');
      return;
    }

    // Get the submit button by class
    const button = form.querySelector('button.processing1');
    if (button) {
      button.disabled = true;
      button.innerHTML = 'Please wait <i class="fa fa-gear fa-spin" style="font-size:24px"></i>';
    }
  });
</script>


<script>
  // document.querySelector('.processing_form').addEventListener('submit', function(event) {
  //   const form = this;

  //   // Validate form
  //   if (!form.checkValidity()) {
  //     event.preventDefault();
  //     event.stopPropagation();
  //     form.classList.add('was-validated');
  //     return;
  //   }

  //   // Get the submit button by class
  //   const button = form.querySelector('button.processing_button');
  //   if (button) {
  //     button.disabled = true;
  //     button.innerHTML = 'Please wait <i class="fa fa-gear fa-spin" style="font-size:24px"></i>';
  //   }
  // });
 
</script>


<script>
function attachProcessingForm(formSelector = '.processing_form', buttonSelector = '.processing_button') {

    const form = document.querySelector(formSelector);
    if (!form) return;

    form.addEventListener('submit', function(event) {

        // Browser Validation
        if (!form.checkValidity()) {
            event.preventDefault();
            event.stopPropagation();
            form.classList.add('was-validated');
            return;
        }

        // Disable the submit button
        const button = form.querySelector(buttonSelector);
        if (button) {
            button.disabled = true;
            button.innerHTML =
                'Please wait <i class="fa fa-gear fa-spin" style="font-size:24px"></i>';
        }
    });
}
</script>


   


</body>

</html>
