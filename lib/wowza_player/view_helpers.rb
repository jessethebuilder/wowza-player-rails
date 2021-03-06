#This code and all components (c) Copyright 2006 - 2017, Wowza Media Systems, LLC.  All rights reserved.
#This code is licensed pursuant to the Wowza Public License version 1.0, available at www.wowza.com/legal.

module WowzaPlayer
  module ViewHelpers

    def wowza_player_script_tag(player_source=nil)
      player_source ||= "https://player.wowza.com/player/latest/wowzaplayer.min.js"
      javascript_include_tag player_source
    end

    def wowza_player_tag(config={})
      style = config.has_key?(:container_style) ? "style='#{config.delete(:container_style)}'" : ""

      unsafe_html = <<-EOS
      <div id="wowza_player" #{style}></div>
      <script type="text/javascript">
        var config = #{JSON.pretty_generate(config)};
        WowzaPlayer.create('wowza_player',config);
      </script>
      EOS
      return unsafe_html.html_safe
    end
  end
end
