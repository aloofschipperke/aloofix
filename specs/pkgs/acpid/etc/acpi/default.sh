#!/bin/sh

set $*

log_event() { logger -t "acpi-handler[$$]" "$@"; }

cpufreq_dir=/sys/devices/system/cpu/cpu0/cpufreq

log_event "$@"

case "$1" in
    button/power)
	case "$2" in
	    PWRF|PBTN)
		/etc/acpi/power_btn.sh
		;;
	    *)
		log_event "undefined ACPI action: $2"
		;;
	esac
	;;
    button/sleep)
	case "$2" in
	    SLPB)
		;;
	    *)
		log_event "undefined ACPI action: $2"
		;;
	esac
	;;
    ac_adapter)
	case "$2" in
	    AC)
		case "$4" in
		    00000000)
			minspeed=`cat ${cpufreq_dir}/cpuinfo_min_freq`
			echo -n $minspeed >${cpufreq_dir}/scaling_setspeed
			echo ondemand >${cpufreq_dir}/scaling_governor
			;;
		    00000001)
			maxspeed=`cat ${cpufreq_dir}/cpuinfo_max_freq`
			echo -n $maxspeed >${cpufreq_dir}/scaling_setspeed
			echo performance >${cpufreq_dir}/scaling_governor
			;;
		esac
		;;
	    *)
		log_event "undefined ACPI action: $2"
		;;
	esac
	;;
    battery)
	case "$2" in
	    BAT0)
		case "$4" in
		    00000000)
			;;
		    00000001)
			;;
		esac
		;;
	    CPU0)
		;;
	    *)
		log_event "undefined ACPI action: $2"
		;;
	esac
	;;
    button/lid)
	;;
    *)
	log_event "undefined ACPI group/action: $1/$2"
	;;
esac

exit 0
