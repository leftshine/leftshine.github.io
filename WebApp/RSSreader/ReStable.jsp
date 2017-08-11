    <link rel="stylesheet" href="css/main.css">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.6/styles/github.min.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.6/highlight.min.js"></script>
    <script>hljs.initHighlightingOnLoad();</script>
    <script type="text/javascript" src="../jquery.restable.min.js"></script>
    <link rel="stylesheet" href="../jquery.restable.min.css">
    <script>
        $(window).ready(function () {
        	$.ReStable();
            $('#table1').ReStable();
            $('#table2').ReStable({rowHeaders: false});
            $('#mytable').ReStable({keepHtml: true, rowHeaders: false});
        });
    </script>