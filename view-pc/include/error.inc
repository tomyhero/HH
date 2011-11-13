[% IF error_obj %]

[% FOREACH e IN error_obj.error_keys() %]
    <div class="alert-message error">[% e %]</div>
[% END %]

[% END %]
