Rails::Timeago.default_options limit: proc { 20.days.ago }, nojs: true
Rails::Timeago.locales = [:en, "zh-CN"]
Rails::Timeago.map_locale "en", "jquery.timeago.js"  # default
Rails::Timeago.map_locale "zh-CN", "locales/jquery.timeago.zh-CN.js"  # default
