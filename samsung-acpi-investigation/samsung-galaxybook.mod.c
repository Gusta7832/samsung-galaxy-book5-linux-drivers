#include <linux/module.h>
#include <linux/export-internal.h>
#include <linux/compiler.h>

MODULE_INFO(name, KBUILD_MODNAME);

__visible struct module __this_module
__section(".gnu.linkonce.this_module") = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};



static const struct modversion_info ____versions[]
__used __section("__versions") = {
	{ 0xcb954983, "devm_platform_profile_register" },
	{ 0xc1e6c71e, "__mutex_init" },
	{ 0x2c2ec44d, "devm_led_classdev_register_ext" },
	{ 0x79075ba3, "devm_battery_hook_register" },
	{ 0xdbc2c1f1, "i8042_install_filter" },
	{ 0xd0aa8f06, "acpi_bus_generate_netlink_event" },
	{ 0x7851be11, "platform_profile_cycle" },
	{ 0xaef1f20d, "system_wq" },
	{ 0x49733ad6, "queue_work_on" },
	{ 0xc3f14114, "serio_interrupt" },
	{ 0xd272d446, "__fentry__" },
	{ 0xd272d446, "__x86_return_thunk" },
	{ 0xd72cd9aa, "__platform_driver_register" },
	{ 0x769c429b, "acpi_execute_simple_method" },
	{ 0x0f2f36db, "acpi_remove_notify_handler" },
	{ 0x64ded58f, "_dev_warn" },
	{ 0x98f6713b, "power_supply_unregister_extension" },
	{ 0x74096a79, "power_supply_register_extension" },
	{ 0x7e040d43, "i8042_remove_filter" },
	{ 0x2d88a3ab, "cancel_work_sync" },
	{ 0xf46d5bf3, "mutex_lock" },
	{ 0x1a90d14f, "led_set_brightness_sync" },
	{ 0xa93c0701, "led_classdev_notify_brightness_hw_changed" },
	{ 0xf46d5bf3, "mutex_unlock" },
	{ 0x64ded58f, "_dev_err" },
	{ 0x76730be0, "platform_driver_unregister" },
	{ 0xc5426db6, "acpi_evaluate_object_typed" },
	{ 0xfbe7861b, "memcpy" },
	{ 0xcb8b6ec6, "kfree" },
	{ 0x97d7321b, "acpi_format_exception" },
	{ 0xd272d446, "__stack_chk_fail" },
	{ 0x609fdaf1, "input_event" },
	{ 0xe4de56b4, "__ubsan_handle_load_invalid_value" },
	{ 0x90a48d82, "__ubsan_handle_out_of_bounds" },
	{ 0x22b9d7e7, "__dynamic_dev_dbg" },
	{ 0x8b53e8d4, "is_acpi_device_node" },
	{ 0xb3b48cc3, "devm_kmalloc" },
	{ 0x0952abaf, "__devm_add_action" },
	{ 0x7a365785, "acpi_install_notify_handler" },
	{ 0xe4e38618, "dev_err_probe" },
	{ 0xd268ca91, "module_layout" },
};

static const u32 ____version_ext_crcs[]
__used __section("__version_ext_crcs") = {
	0xcb954983,
	0xc1e6c71e,
	0x2c2ec44d,
	0x79075ba3,
	0xdbc2c1f1,
	0xd0aa8f06,
	0x7851be11,
	0xaef1f20d,
	0x49733ad6,
	0xc3f14114,
	0xd272d446,
	0xd272d446,
	0xd72cd9aa,
	0x769c429b,
	0x0f2f36db,
	0x64ded58f,
	0x98f6713b,
	0x74096a79,
	0x7e040d43,
	0x2d88a3ab,
	0xf46d5bf3,
	0x1a90d14f,
	0xa93c0701,
	0xf46d5bf3,
	0x64ded58f,
	0x76730be0,
	0xc5426db6,
	0xfbe7861b,
	0xcb8b6ec6,
	0x97d7321b,
	0xd272d446,
	0x609fdaf1,
	0xe4de56b4,
	0x90a48d82,
	0x22b9d7e7,
	0x8b53e8d4,
	0xb3b48cc3,
	0x0952abaf,
	0x7a365785,
	0xe4e38618,
	0xd268ca91,
};
static const char ____version_ext_names[]
__used __section("__version_ext_names") =
	"devm_platform_profile_register\0"
	"__mutex_init\0"
	"devm_led_classdev_register_ext\0"
	"devm_battery_hook_register\0"
	"i8042_install_filter\0"
	"acpi_bus_generate_netlink_event\0"
	"platform_profile_cycle\0"
	"system_wq\0"
	"queue_work_on\0"
	"serio_interrupt\0"
	"__fentry__\0"
	"__x86_return_thunk\0"
	"__platform_driver_register\0"
	"acpi_execute_simple_method\0"
	"acpi_remove_notify_handler\0"
	"_dev_warn\0"
	"power_supply_unregister_extension\0"
	"power_supply_register_extension\0"
	"i8042_remove_filter\0"
	"cancel_work_sync\0"
	"mutex_lock\0"
	"led_set_brightness_sync\0"
	"led_classdev_notify_brightness_hw_changed\0"
	"mutex_unlock\0"
	"_dev_err\0"
	"platform_driver_unregister\0"
	"acpi_evaluate_object_typed\0"
	"memcpy\0"
	"kfree\0"
	"acpi_format_exception\0"
	"__stack_chk_fail\0"
	"input_event\0"
	"__ubsan_handle_load_invalid_value\0"
	"__ubsan_handle_out_of_bounds\0"
	"__dynamic_dev_dbg\0"
	"is_acpi_device_node\0"
	"devm_kmalloc\0"
	"__devm_add_action\0"
	"acpi_install_notify_handler\0"
	"dev_err_probe\0"
	"module_layout\0"
;

MODULE_INFO(depends, "platform_profile");

MODULE_ALIAS("acpi*:SAM0426:*");
MODULE_ALIAS("acpi*:SAM0427:*");
MODULE_ALIAS("acpi*:SAM0428:*");
MODULE_ALIAS("acpi*:SAM0429:*");
MODULE_ALIAS("acpi*:SAM0430:*");

MODULE_INFO(srcversion, "EE6039035937C077CB03440");
