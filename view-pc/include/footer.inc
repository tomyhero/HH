        <footer>
          <p>sample web application using <a href="https://github.com/tomyhero/Ze">Ze</a> / author <a href="http://twitter.com/tomyhero">@tomyhero</a>  / powerd by <a href="https://github.com/tomyhero/Ze">Ze</a> / source code <a href="https://github.com/tomyhero/HH">HH</a></p>

        </footer>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
        <script src="/static/common/js/bootstrap-modal.js"></script>
        <script src="/static/common/js/hh-auth.js"></script>
[% footer_content %]

<script>
function popup(a){
    var width = $(a).attr('data-width') || 720;
    var height = $(a).attr('data-height') || 500;
    var left = (screen.availWidth - width) / 2;
    var top = (screen.availHeight - height) / 2;
    var scrollbars = $(a).attr('data-scrollbars') || 'no';
    left = left < 0 ? 0 : left;
    top = top < 0 ? 0 : top;
    var login_window = window.open(
            a.href,
            'login_window',
            "height=" + height + ",width=" + width + ",left=" + left + ",top=" + top + ",resizable=yes" + ",scrollbars=" + scrollbars
            );
    login_window.focus();
    return false;
}

HHAUth.load();

</script>



</body>
</html>
