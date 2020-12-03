QT += quick
QT += svg

CONFIG += c++11
CONFIG += sdk_no_version_check #Temporary for testing
# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp

RESOURCES += \
    qml.qrc

TRANSLATIONS += \
    GridcoinWalletGUI_en_AU.ts

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

#DISTFILES += \
#    Icons/Buttons/ic_btn_add_dark.svg \
#    Icons/Buttons/ic_btn_add_light.svg \
#    Icons/Buttons/ic_btn_archive_dark.svg \
#    Icons/Buttons/ic_btn_archive_light.svg \
#    Icons/Buttons/ic_btn_attach_dark.svg \
#    Icons/Buttons/ic_btn_attach_light.svg \
#    Icons/Buttons/ic_btn_clear_all_dark.svg \
#    Icons/Buttons/ic_btn_clear_all_light.svg \
#    Icons/Buttons/ic_btn_create_dark.svg \
#    Icons/Buttons/ic_btn_create_light.svg \
#    Icons/Buttons/ic_btn_detach_dark.svg \
#    Icons/Buttons/ic_btn_detach_light.svg \
#    Icons/Buttons/ic_btn_details_dark.svg \
#    Icons/Buttons/ic_btn_details_light.svg \
#    Icons/Buttons/ic_btn_discard_dark.svg \
#    Icons/Buttons/ic_btn_discard_light.svg \
#    Icons/Buttons/ic_btn_enter_dark.svg \
#    Icons/Buttons/ic_btn_enter_light.svg \
#    Icons/Buttons/ic_btn_load_more_dark.svg \
#    Icons/Buttons/ic_btn_load_more_light.svg \
#    Icons/Buttons/ic_btn_log_dark.svg \
#    Icons/Buttons/ic_btn_log_light.svg \
#    Icons/Buttons/ic_btn_open_menu_dark.svg \
#    Icons/Buttons/ic_btn_open_menu_light.svg \
#    Icons/Buttons/ic_btn_paste_dark.svg \
#    Icons/Buttons/ic_btn_paste_light.svg \
#    Icons/Buttons/ic_btn_qr_code_dark.svg \
#    Icons/Buttons/ic_btn_qr_code_light.svg \
#    Icons/Buttons/ic_btn_refresh_dark.svg \
#    Icons/Buttons/ic_btn_refresh_light.svg \
#    Icons/Buttons/ic_btn_remove_dark.svg \
#    Icons/Buttons/ic_btn_remove_light.svg \
#    Icons/Buttons/ic_btn_save_dark.svg \
#    Icons/Buttons/ic_btn_save_light.svg \
#    Icons/Buttons/ic_btn_save_qr_dark.svg \
#    Icons/Buttons/ic_btn_save_qr_light.svg \
#    Icons/Buttons/ic_btn_save_to_file_dark.svg \
#    Icons/Buttons/ic_btn_save_to_file_light.svg \
#    Icons/Buttons/ic_btn_send_dark.svg \
#    Icons/Buttons/ic_btn_send_light.svg \
#    Icons/Buttons/ic_btn_show_key_dark.svg \
#    Icons/Buttons/ic_btn_show_key_light.svg \
#    Icons/Buttons/ic_btn_sign_dark.svg \
#    Icons/Buttons/ic_btn_sign_light.svg \
#    Icons/Buttons/ic_btn_unarchive_dark.svg \
#    Icons/Buttons/ic_btn_unarchive_light.svg \
#    Icons/Buttons/ic_btn_unlock_dark.svg \
#    Icons/Buttons/ic_btn_unlock_light.svg \
#    Icons/Buttons/ic_btn_update_dark.svg \
#    Icons/Buttons/ic_btn_update_light.svg \
#    Icons/Buttons/ic_btn_verify_dark.svg \
#    Icons/Buttons/ic_btn_verify_light.svg \
#    Icons/Buttons/ic_btn_vote_dark.svg \
#    Icons/Buttons/ic_btn_vote_light.svg \
#    Icons/Events/ic_event_green.svg \
#    Icons/Events/ic_event_green_purple.svg \
#    Icons/Events/ic_event_green_red.svg \
#    Icons/Events/ic_event_purple.svg \
#    Icons/Events/ic_event_purple_white.svg \
#    Icons/Events/ic_event_red.svg \
#    Icons/Events/ic_event_yellow.svg \
#    Icons/Events/ic_event_yellow_purple.svg \
#    Icons/Generic/ic_add_dark.svg \
#    Icons/Generic/ic_add_light.svg \
#    Icons/Generic/ic_alert.svg \
#    Icons/Generic/ic_arrow_down_dark.svg \
#    Icons/Generic/ic_arrow_down_light.svg \
#    Icons/Generic/ic_arrow_up_dark.svg \
#    Icons/Generic/ic_arrow_up_light.svg \
#    Icons/Generic/ic_checkbox_tick.svg \
#    Icons/Generic/ic_chevron_down_dark.svg \
#    Icons/Generic/ic_chevron_down_light.svg \
#    Icons/Generic/ic_chevron_up_dark.svg \
#    Icons/Generic/ic_chevron_up_light.svg \
#    Icons/Generic/ic_close_dark.svg \
#    Icons/Generic/ic_close_light.svg \
#    Icons/Generic/ic_copy_dark.svg \
#    Icons/Generic/ic_copy_light.svg \
#    Icons/Generic/ic_date_dark.svg \
#    Icons/Generic/ic_date_light.svg \
#    Icons/Generic/ic_help.svg \
#    Icons/Generic/ic_info_dark.svg \
#    Icons/Generic/ic_info_light.svg \
#    Icons/Generic/ic_negative.svg \
#    Icons/Generic/ic_open_link.svg \
#    Icons/Generic/ic_positive.svg \
#    Icons/Generic/ic_remove_dark.svg \
#    Icons/Generic/ic_remove_light.svg \
#    Icons/Generic/ic_search_dark.svg \
#    Icons/Generic/ic_search_light.svg \
#    Icons/Logos/ic_logo_app_gradient_white.svg \
#    Icons/Logos/ic_logo_boinc_color.svg \
#    Icons/Menu/ic_menu_favorites_blue.svg \
#    Icons/Menu/ic_menu_favorites_white.svg \
#    Icons/Menu/ic_menu_history_blue.svg \
#    Icons/Menu/ic_menu_history_white.svg \
#    Icons/Menu/ic_menu_lock_blue.svg \
#    Icons/Menu/ic_menu_lock_white.svg \
#    Icons/Menu/ic_menu_news_blue.svg \
#    Icons/Menu/ic_menu_news_white.svg \
#    Icons/Menu/ic_menu_overview_blue.svg \
#    Icons/Menu/ic_menu_overview_white.svg \
#    Icons/Menu/ic_menu_polls_blue.svg \
#    Icons/Menu/ic_menu_polls_white.svg \
#    Icons/Menu/ic_menu_receive_blue.svg \
#    Icons/Menu/ic_menu_receive_white.svg \
#    Icons/Menu/ic_menu_send_blue.svg \
#    Icons/Menu/ic_menu_send_white.svg \
#    Icons/Menu/ic_menu_settings_blue.svg \
#    Icons/Menu/ic_menu_settings_white.svg \
#    Icons/Menu/ic_menu_unlock_blue.svg \
#    Icons/Menu/ic_menu_unlock_white.svg \
#    Icons/Status Bar/Beacon/ic_beacon_offline_dark.svg \
#    Icons/Status Bar/Beacon/ic_beacon_offline_light.svg \
#    Icons/Status Bar/Beacon/ic_beacon_online_dark.svg \
#    Icons/Status Bar/Beacon/ic_beacon_online_light.svg \
#    Icons/Status Bar/Connection/ic_connection_average_dark.svg \
#    Icons/Status Bar/Connection/ic_connection_average_light.svg \
#    Icons/Status Bar/Connection/ic_connection_good_dark.svg \
#    Icons/Status Bar/Connection/ic_connection_good_light.svg \
#    Icons/Status Bar/Connection/ic_connection_na_dark.svg \
#    Icons/Status Bar/Connection/ic_connection_na_light.svg \
#    Icons/Status Bar/Connection/ic_connection_normal_dark.svg \
#    Icons/Status Bar/Connection/ic_connection_normal_light.svg \
#    Icons/Status Bar/Connection/ic_connection_poor_dark.svg \
#    Icons/Status Bar/Connection/ic_connection_poor_light.svg \
#    Icons/Status Bar/Lock/ic_locked_dark.svg \
#    Icons/Status Bar/Lock/ic_locked_light.svg \
#    Icons/Status Bar/Lock/ic_unlocked.svg \
#    Icons/Status Bar/Lock/ic_unlocked_staking_dark.svg \
#    Icons/Status Bar/Lock/ic_unlocked_staking_light.svg \
#    Icons/Status Bar/Network/ic_syncing_25_dark.svg \
#    Icons/Status Bar/Network/ic_syncing_25_light.svg \
#    Icons/Status Bar/Network/ic_syncing_50_dark.svg \
#    Icons/Status Bar/Network/ic_syncing_50_light.svg \
#    Icons/Status Bar/Network/ic_syncing_75_dark.svg \
#    Icons/Status Bar/Network/ic_syncing_75_light.svg \
#    Icons/Status Bar/Network/ic_syncing_90_dark.svg \
#    Icons/Status Bar/Network/ic_syncing_90_light.svg \
#    Icons/Status Bar/Network/ic_syncing_stuck_dark.svg \
#    Icons/Status Bar/Network/ic_syncing_stuck_light.svg \
#    Icons/Status Bar/Network/ic_syncing_unsynced_dark.svg \
#    Icons/Status Bar/Network/ic_syncing_unsynced_light.svg \
#    Icons/Status Bar/Network/ic_syncing_uptodate.svg \
#    Icons/Status Bar/Staking/ic_staking_no_dark.svg \
#    Icons/Status Bar/Staking/ic_staking_no_light.svg \
#    Icons/Status Bar/Staking/ic_staking_yes_dark.svg \
#    Icons/Status Bar/Staking/ic_staking_yes_light.svg \
#    Icons/Tabs/ic_tab_about_dark.svg \
#    Icons/Tabs/ic_tab_about_light.svg \
#    Icons/Tabs/ic_tab_beacon_dark.svg \
#    Icons/Tabs/ic_tab_beacon_light.svg \
#    Icons/Tabs/ic_tab_cmd_line_dark.svg \
#    Icons/Tabs/ic_tab_cmd_line_light.svg \
#    Icons/Tabs/ic_tab_console_dark.svg \
#    Icons/Tabs/ic_tab_console_light.svg \
#    Icons/Tabs/ic_tab_display_dark.svg \
#    Icons/Tabs/ic_tab_display_light.svg \
#    Icons/Tabs/ic_tab_general_dark.svg \
#    Icons/Tabs/ic_tab_general_light.svg \
#    Icons/Tabs/ic_tab_info_dark.svg \
#    Icons/Tabs/ic_tab_info_light.svg \
#    Icons/Tabs/ic_tab_more_dark.svg \
#    Icons/Tabs/ic_tab_more_light.svg \
#    Icons/Tabs/ic_tab_net_traffic_dark.svg \
#    Icons/Tabs/ic_tab_net_traffic_light.svg \
#    Icons/Tabs/ic_tab_network_dark.svg \
#    Icons/Tabs/ic_tab_network_light.svg \
#    Icons/Tabs/ic_tab_nodes_dark.svg \
#    Icons/Tabs/ic_tab_nodes_light.svg \
#    Icons/Tabs/ic_tab_window_dark.svg \
#    Icons/Tabs/ic_tab_window_light.svg \
#    Icons/Transaction Levels/ic_tran_lv1.svg \
#    Icons/Transaction Levels/ic_tran_lv2.svg \
#    Icons/Transaction Levels/ic_tran_lv3.svg \
#    Icons/Transaction Levels/ic_tran_lv4.svg \
#    Icons/Transaction Levels/ic_tran_lv5.svg \
#    Icons/Transaction Levels/ic_tran_lv6.svg
