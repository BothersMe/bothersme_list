require "bothersme_list/version"

module BothersmeList
  # Inserts "Track an Issue" button on a side
  #
  # Parameters:
  #  type: 'website', 'camera', 'wearable'
  #  company: 'YourCompanyName'
  #  product: 'YourProductName' or nil if used for all products
  #
  def issues_list(type, company, product=nil, side='right', textColor='white', bgColor='#55B055')
    %{
      <!-- Bothers.Me button -->
      <script>
          (function(w,d,fn,params) {
              if(w[fn]) {
                w[fn]();
              } else {
                w[fn] = w[fn] || function() { ( w[fn].q = w[fn].q||[] ).push(arguments); };
                var script  = d.createElement('script');
                var parent  = d.getElementsByTagName('script')[0];
                script.async = 1;
                script.src   = '//<%= domain_root %>/bm_track_issue/bm_track_issue-v1.js';
                script.setAttribute('fn',fn);
                script.setAttribute('params',JSON.stringify(params));
                parent.parentNode.insertBefore(script, parent);
            }
          })(window, document, 'BMTrackIssue',
                  {'side': '#{side}', 'textColor': '#{textColor}', 'bgColor': '#{bgColor}',
                   'data': {
                            'type': '#{type}',
                         'company': '#{company}',
                         'product': '#{product}',
                            'user': '' }});
      </script>
    }
  end
end

ActionView::Base.send :include, BothersmeList if defined?(Rails)