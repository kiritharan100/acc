<?php
save_date($_POST['perid_from'] ?? '');
    
    ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Datepicker Example</title>

    <!-- Bootstrap 4 CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"/>

    <style>
        .datepicker {
            z-index: 9999 !important;
        }
    </style>
</head>

<body class="p-5">

    <div class="container">
        <h4 class="mb-4">Bootstrap 4 – dd/mm/yyyy Datepicker Demo</h4>

        <div class="form-group">
            <label>Period From</label>
            <input type="text" class="form-control date_input" value="11/01/2025">
        </div>

        <div class="form-group">
            <label>Period To</label>
            <input type="text" class="form-control date_input">
        </div>

        <div class="form-group">
            <label>Due Date</label>
            <input type="text" class="form-control date_input">
        </div>
    </div>


    <!-- REQUIRED JS -->

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
    </script>

</body>
</html>
