#!/bin/sh
set -e

# 写 wireless 配置（注意：EOF 必须顶格；用 <<- 允许行首 Tab）
cat <<-'EOF' > /etc/config/wireless
config wifi-device 'radio0'
	option type 'mac80211'
	option path 'platform/soc@0/c000000.wifi'
	option band '5g'
	option channel 'auto'
	option htmode 'HE80'
	option disabled '0'
	option mu_beamformer '1'
	option country 'CN'
	option txpower '20'
	option cell_density '0'

config wifi-iface 'default_radio0'
	option device 'radio0'
	option network 'lan'
	option mode 'ap'
	option ssid 'ADV'
	option encryption 'psk2+ccmp'
	option key '012345678'
	option ieee80211k '1'
	option time_advertisement '2'
	option time_zone 'CST-8'
	option bss_transition '1'
	option wnm_sleep_mode '1'
	option wnm_sleep_mode_no_keys '1'

config wifi-device 'radio1'
	option type 'mac80211'
	option path 'platform/soc@0/c000000.wifi+1'
	option band '2g'
	option channel 'auto'
	option htmode 'HT20'
	option disabled '0'
	option mu_beamformer '1'
	option country 'CN'
	option txpower '20'
	option cell_density '0'

config wifi-iface 'default_radio1'
	option device 'radio1'
	option network 'lan'
	option mode 'ap'
	option ssid 'Adn'
	option encryption 'psk2+ccmp'
	option key '012345678'
	option ieee80211k '1'
	option time_advertisement '2'
	option time_zone 'CST-8'
	option bss_transition '1'
	option wnm_sleep_mode '1'
	option wnm_sleep_mode_no_keys '1'
EOF

# 让 uci-defaults 正常清理本脚本（也可以不手动删，系统会清）
rm -f /etc/uci-defaults/99_wireless_setup

exit 0
