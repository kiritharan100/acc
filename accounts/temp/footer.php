
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
   <script>
   
    $(document).ready(function() {
    $('#search_client').select2();
  });
</script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <!-- Global Datepicker Functions -->
 <script>
        // Global function to initialize datepickers
        function initializeDatepickers() {
       $('.datepicker').datepicker
       $('.datepicker').datepicker({
           format: 'dd-mm-yyyy',
           todayHighlight: true,
           autoclose: true,
           orientation: 'bottom auto',
           forceParse: false,
           keyboardNavigation: true
       });
       
       // Allow only numbers, hyphens, and slashes for date input
       $('.datepicker').on('input keypress', function(e) {
           var value = $(this).val();
           var key = e.which || e.keyCode;
           var char = String.fromCharCode(key);
           // Allow: backspace, delete, tab, escape, enter, left/right arrows
           if (key === 8 || key === 9 || key === 27 || key === 13 || key === 46 || key === 37 || key === 39) {
               return true;
           }
           // Allow: numbers (0-9), hyphen (-), slash (/)
           if ((key >= 48 && key <= 57) || char === '-' || char === '/') {
               setTimeout(function() {
                   formatDateInput($(e.target));
               }, 10);
               return true;
           }
           // Prevent all other characters
           e.preventDefault();
           return false;
       });
       
       // Handle paste events
       $('.datepicker').on('paste', function(e) {
           var self = $(this);
           setTimeout(function() {
               var value = self.val();
               // Remove any non-numeric, non-hyphen, non-slash characters
               value = value.replace(/[^0-9\-\/]/g, '');
               self.val(value);
               formatDateInput(self);
           }, 10);
       });
       
       // Click event for calendar icons
       $('.input-group-text').on('click', function() {
           $(this).closest('.input-group').find('.datepicker').datepicker('show');
       });
       
       // Validate on blur
       $('.datepicker').off('blur').on('blur', function() {
        // On blur, normalize to hyphens and format to DD-MM-YYYY
        var input = $(this);
        var value = input.val();
        if (value) {
        value = value.replace(/\//g, '-');
        value = value.replace(/[^0-9\-]/g, '');
        // Remove multiple consecutive hyphens
        value = value.replace(/\-+/g, '-');
        // Format to DD-MM-YYYY if possible
        var numbers = value.replace(/\-/g, '').replace(/[^0-9]/g, '');
        var formatted = '';
        if (numbers.length >= 2) {
            formatted = numbers.substring(0, 2);
            if (numbers.length >= 4) {
                formatted += '-' + numbers.substring(2, 4);
                if (numbers.length >= 8) {
                    formatted += '-' + numbers.substring(4, 8);
                } else if (numbers.length > 4) {
                    formatted += '-' + numbers.substring(4);
                }
            } else if (numbers.length > 2) {
                formatted += '-' + numbers.substring(2);
            }
        } else {
            formatted = numbers;
        }
        input.val(formatted);
            }
            validateDateFormat(input);
        });
        }

        // Global function to format date input as user types
        function formatDateInput(input) {
            var value = input.val();
            // Allow numbers, hyphens, and slashes as the user types
            value = value.replace(/[^0-9\-\/]/g, '');
            // Remove multiple consecutive separators (hyphens or slashes)
            value = value.replace(/([\-\/])\1+/g, '$1');
            input.val(value);
        }

       // Global function to validate date format
     function validateDateFormat(input) {
       var value = input.val();
       var dateRegex = /^(0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[0-2])-\d{4}$/;
       
       if (value && !dateRegex.test(value)) {
           // If format is wrong, clear the field and show error
           input.addClass('is-invalid');
           input.attr('title', 'Please enter date in DD-MM-YYYY format');
           
           // Remove error styling after 3 seconds
           setTimeout(function() {
               input.removeClass('is-invalid');
               input.removeAttr('title');
           }, 3000);
       } else if (value) {
           // If format is correct, validate actual date
           var parts = value.split('-');
           var day = parseInt(parts[0], 10);
           var month = parseInt(parts[1], 10);
           var year = parseInt(parts[2], 10);
           
           var date = new Date(year, month - 1, day);
           
           if (date.getFullYear() !== year || date.getMonth() !== (month - 1) || date.getDate() !== day) {
               input.addClass('is-invalid');
               input.attr('title', 'Please enter a valid date');
               
               setTimeout(function() {
                   input.removeClass('is-invalid');
                   input.removeAttr('title');
               }, 3000);
           } else {
               input.removeClass('is-invalid');
               input.removeAttr('title');
           }
       }
        }

        // Auto-initialize datepickers when document is ready
        $(document).ready(function() {
            initializeDatepickers();
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
  document.querySelector('.processing_form').addEventListener('submit', function(event) {
    const form = this;

    // Validate form
    if (!form.checkValidity()) {
      event.preventDefault();
      event.stopPropagation();
      form.classList.add('was-validated');
      return;
    }

    // Get the submit button by class
    const button = form.querySelector('button.processing_button');
    if (button) {
      button.disabled = true;
      button.innerHTML = 'Please wait <i class="fa fa-gear fa-spin" style="font-size:24px"></i>';
    }
  });
 
</script>


   


</body>

</html>
