require "bothersme_list/version"

module BothersmeList
  # Inserts "Track an Issue" button on a side
  # @see http://bothers.me as an example
  #
  # Usage:
  #
  #    <%= issues_list('website', 'MyWebsite.com', 'MyProduct') %>
  #
  # right before "</body>" to asynchronously add "Track an Issue" button.
  #
  # @param [String, #read] type indicates the type of the product. Supported types are: 'website', 'camera', 'wearable'
  # @param [String, #read] company is your company name camel case like 'MyCompany'
  # @param [optional, String, #read] product name of your product came case like "My Product", you can pass nil to render issues for all products
  # @param [optional, String, #read] side which side to render on, supported 'left', 'right', default: 'right'
  # @param [optional, String, #read] textColor CSS color to render as foreground color. default 'white'
  # @param [optional, String, #read] bgColor CSS color to render as background color, default '#55B055'
  # @return [String] the HTML safe <script> tag containing code to add the button
  def issues_list(type, company, product=nil, side='right', textColor='white', bgColor='#55B055')
    button_script = %{
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
    button_script = button_script.html_safe if defined?(Rails)
    return button_script
  end
end

ActionView::Base.send :include, BothersmeList if defined?(Rails)