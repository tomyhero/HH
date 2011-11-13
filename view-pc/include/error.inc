[% IF error_obj %]

[% FOREACH e IN error_obj.error_message.keys() %]
<div class="alert-message error">[% error_obj.error_message.${e} || e %]</div>
[% END %]
[% FOREACH e IN error_obj.custom_invalid %]
<div class="alert-message error">[% error_obj.error_message.${e} || e %]</div>
[% END %]

[% END %]
