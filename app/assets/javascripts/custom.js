<script>
$('.navbar-toggle').on('click', function(e){
            $('.glyphicon').toggleClass('rotate1 rotate2');
});
</script>

<script>
  $(document).ready(function () {
        $('ul.nav > li').click(function (e) {
            $('ul.nav > li').removeClass('active');
            $(this).addClass('active');
        });
    });
  </script>
