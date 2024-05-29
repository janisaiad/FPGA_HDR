  //Example instantiation for system 'nios_audio'
  nios_audio nios_audio_inst
    (
      .LCD_E_from_the_lcd                     (LCD_E_from_the_lcd),
      .LCD_RS_from_the_lcd                    (LCD_RS_from_the_lcd),
      .LCD_RW_from_the_lcd                    (LCD_RW_from_the_lcd),
      .LCD_data_to_and_from_the_lcd           (LCD_data_to_and_from_the_lcd),
      .SEG7_from_the_seg7                     (SEG7_from_the_seg7),
      .SRAM_ADDR_from_the_sram                (SRAM_ADDR_from_the_sram),
      .SRAM_CE_n_from_the_sram                (SRAM_CE_n_from_the_sram),
      .SRAM_DQ_to_and_from_the_sram           (SRAM_DQ_to_and_from_the_sram),
      .SRAM_LB_n_from_the_sram                (SRAM_LB_n_from_the_sram),
      .SRAM_OE_n_from_the_sram                (SRAM_OE_n_from_the_sram),
      .SRAM_UB_n_from_the_sram                (SRAM_UB_n_from_the_sram),
      .SRAM_WE_n_from_the_sram                (SRAM_WE_n_from_the_sram),
      .USB_ADDR_from_the_usb                  (USB_ADDR_from_the_usb),
      .USB_CS_N_from_the_usb                  (USB_CS_N_from_the_usb),
      .USB_DATA_to_and_from_the_usb           (USB_DATA_to_and_from_the_usb),
      .USB_INT0_to_the_usb                    (USB_INT0_to_the_usb),
      .USB_INT1_to_the_usb                    (USB_INT1_to_the_usb),
      .USB_RD_N_from_the_usb                  (USB_RD_N_from_the_usb),
      .USB_RST_N_from_the_usb                 (USB_RST_N_from_the_usb),
      .USB_WR_N_from_the_usb                  (USB_WR_N_from_the_usb),
      .address_to_the_cfi_flash               (address_to_the_cfi_flash),
      .altpll_25                              (altpll_25),
      .altpll_io                              (altpll_io),
      .altpll_sdram                           (altpll_sdram),
      .altpll_sys                             (altpll_sys),
      .audio_18                               (audio_18),
      .avs_s1_export_ADCDAT_to_the_audio      (avs_s1_export_ADCDAT_to_the_audio),
      .avs_s1_export_ADCLRC_to_the_audio      (avs_s1_export_ADCLRC_to_the_audio),
      .avs_s1_export_BCLK_to_the_audio        (avs_s1_export_BCLK_to_the_audio),
      .avs_s1_export_DACDAT_from_the_audio    (avs_s1_export_DACDAT_from_the_audio),
      .avs_s1_export_DACLRC_to_the_audio      (avs_s1_export_DACLRC_to_the_audio),
      .avs_s1_export_XCK_from_the_audio       (avs_s1_export_XCK_from_the_audio),
      .bidir_port_to_and_from_the_eep_i2c_sda (bidir_port_to_and_from_the_eep_i2c_sda),
      .bidir_port_to_and_from_the_i2c_sda     (bidir_port_to_and_from_the_i2c_sda),
      .bidir_port_to_and_from_the_sd_cmd      (bidir_port_to_and_from_the_sd_cmd),
      .bidir_port_to_and_from_the_sd_dat      (bidir_port_to_and_from_the_sd_dat),
      .clk_50                                 (clk_50),
      .in_port_to_the_key                     (in_port_to_the_key),
      .in_port_to_the_sd_wp_n                 (in_port_to_the_sd_wp_n),
      .in_port_to_the_sw                      (in_port_to_the_sw),
      .locked_from_the_altpll                 (locked_from_the_altpll),
      .locked_from_the_altpll_audio           (locked_from_the_altpll_audio),
      .out_port_from_the_eep_i2c_scl          (out_port_from_the_eep_i2c_scl),
      .out_port_from_the_i2c_scl              (out_port_from_the_i2c_scl),
      .out_port_from_the_pio_led              (out_port_from_the_pio_led),
      .out_port_from_the_sd_clk               (out_port_from_the_sd_clk),
      .phasedone_from_the_altpll              (phasedone_from_the_altpll),
      .phasedone_from_the_altpll_audio        (phasedone_from_the_altpll_audio),
      .read_n_to_the_cfi_flash                (read_n_to_the_cfi_flash),
      .reset_n                                (reset_n),
      .select_n_to_the_cfi_flash              (select_n_to_the_cfi_flash),
      .tri_state_bridge_flash_data            (tri_state_bridge_flash_data),
      .write_n_to_the_cfi_flash               (write_n_to_the_cfi_flash),
      .zs_addr_from_the_sdram                 (zs_addr_from_the_sdram),
      .zs_ba_from_the_sdram                   (zs_ba_from_the_sdram),
      .zs_cas_n_from_the_sdram                (zs_cas_n_from_the_sdram),
      .zs_cke_from_the_sdram                  (zs_cke_from_the_sdram),
      .zs_cs_n_from_the_sdram                 (zs_cs_n_from_the_sdram),
      .zs_dq_to_and_from_the_sdram            (zs_dq_to_and_from_the_sdram),
      .zs_dqm_from_the_sdram                  (zs_dqm_from_the_sdram),
      .zs_ras_n_from_the_sdram                (zs_ras_n_from_the_sdram),
      .zs_we_n_from_the_sdram                 (zs_we_n_from_the_sdram)
    );

