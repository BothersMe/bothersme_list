require "bothersme_list/version"

module BothersmeList
  BASE_DOMAIN = 'bothers.me'
  ENV_PREFIX = { 'development'=>'dev.', 'test'=>'dev.', 'staging'=>'test.', 'production'=>'' }
  DEFAULT_ENV_PREFIX = 'test.'
  DEFAULT_NO_ENV_PREFIX = 'dev.'

  # Inserts "Track an Issue" button on a side
  # @see http://bothers.me as an example
  #
  # @example Usage:
  #
  #    <%= issues_list('website', 'MyWebsite.com', 'MyProduct') %>
  #
  # right before "</body>" to asynchronously add "Track an Issue" button.
  #
  # @param type [String] indicates the type of the product. Supported types are: 'website', 'camera', 'wearable'
  # @param company [String] is your company name camel case like 'MyCompany'
  # @param product [String] name of your product came case like "My Product", you can pass nil to render issues for all products
  # @param side [String] which side to render on, supported 'left', 'right', default: 'right'
  # @param textColor [String] CSS color to render as foreground color. default 'white'
  # @param bgColor [String] CSS color to render as background color, default '#55B055'
  #
  # @return [String] the HTML safe <script> tag containing code to add the button
  def issues_list(type, company, product=nil, side='right', textColor='white', bgColor='#55B055')
    server = detect_bothers_server_name()

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
                script.src   = '//#{server}/bm_track_issue/bm_track_issue-v1.js';
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
    button_script = button_script.html_safe if button_script.respond_to?(:html_safe)
    return button_script
  end

  def detect_bothers_server_name
    server = BASE_DOMAIN
    prefix = DEFAULT_NO_ENV_PREFIX
    if defined?(Rails)
      rails_env = Rails.env.to_s
      prefix = DEFAULT_ENV_PREFIX
      if ENV_PREFIX.has_key?(rails_env)
        prefix = ENV_PREFIX[rails_env]
      end
    end
    return prefix + server
  end
end

ActionView::Base.send :include, BothersmeList if defined?(ActionView)