/* Automatically generated, do not edit */

:-module(escapes,[isEscape/1,escapeType/2]).

escapeType("_exit",funType(tupleType([type("star.core*integer")]),voidType)).
escapeType("_command_line",funType(tupleType([]),typeExp(tpFun("star.core*list",1),[type("star.core*string")]))).
escapeType("_abort",allType(kVar("s"),allType(kVar("t"),funType(tupleType([kVar("s"),kVar("t")]),voidType)))).
escapeType("_identical",allType(kVar("t"),funType(tupleType([kVar("t"),kVar("t")]),type("star.core*boolean")))).
escapeType("_defined",funType(tupleType([type("star.core*string"),type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_int_plus",funType(tupleType([type("star.core*integer"),type("star.core*integer")]),type("star.core*integer"))).
escapeType("_int_minus",funType(tupleType([type("star.core*integer"),type("star.core*integer")]),type("star.core*integer"))).
escapeType("_int_times",funType(tupleType([type("star.core*integer"),type("star.core*integer")]),type("star.core*integer"))).
escapeType("_int_div",funType(tupleType([type("star.core*integer"),type("star.core*integer")]),type("star.core*integer"))).
escapeType("_int_mod",funType(tupleType([type("star.core*integer"),type("star.core*integer")]),type("star.core*integer"))).
escapeType("_int_hash",funType(tupleType([type("star.core*integer")]),type("star.core*integer"))).
escapeType("_flt_plus",funType(tupleType([type("star.core*float"),type("star.core*float")]),type("star.core*float"))).
escapeType("_flt_minus",funType(tupleType([type("star.core*float"),type("star.core*float")]),type("star.core*float"))).
escapeType("_flt_times",funType(tupleType([type("star.core*float"),type("star.core*float")]),type("star.core*float"))).
escapeType("_flt_div",funType(tupleType([type("star.core*float"),type("star.core*float")]),type("star.core*float"))).
escapeType("_flt_mod",funType(tupleType([type("star.core*float"),type("star.core*float")]),type("star.core*float"))).
escapeType("_int_abs",funType(tupleType([type("star.core*integer")]),type("star.core*integer"))).
escapeType("_flt_abs",funType(tupleType([type("star.core*integer")]),type("star.core*integer"))).
escapeType("_int_eq",funType(tupleType([type("star.core*integer"),type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_int_lt",funType(tupleType([type("star.core*integer"),type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_int_ge",funType(tupleType([type("star.core*integer"),type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_flt_eq",funType(tupleType([type("star.core*float"),type("star.core*float")]),type("star.core*boolean"))).
escapeType("_flt_lt",funType(tupleType([type("star.core*float"),type("star.core*float")]),type("star.core*boolean"))).
escapeType("_flt_ge",funType(tupleType([type("star.core*float"),type("star.core*float")]),type("star.core*boolean"))).
escapeType("_int2flt",funType(tupleType([type("star.core*integer")]),type("star.core*float"))).
escapeType("_flt2int",funType(tupleType([type("star.core*float")]),type("star.core*integer"))).
escapeType("_flt_hash",funType(tupleType([type("star.core*float")]),type("star.core*integer"))).
escapeType("_flt_pwr",funType(tupleType([type("star.core*float"),type("star.core*float")]),type("star.core*float"))).
escapeType("sqrt",funType(tupleType([type("star.core*float")]),type("star.core*float"))).
escapeType("_exp",funType(tupleType([type("star.core*float")]),type("star.core*float"))).
escapeType("log",funType(tupleType([type("star.core*float")]),type("star.core*float"))).
escapeType("log10",funType(tupleType([type("star.core*float")]),type("star.core*float"))).
escapeType("pi",funType(tupleType([]),type("star.core*float"))).
escapeType("sin",funType(tupleType([type("star.core*float")]),type("star.core*float"))).
escapeType("cos",funType(tupleType([type("star.core*float")]),type("star.core*float"))).
escapeType("tan",funType(tupleType([type("star.core*float")]),type("star.core*float"))).
escapeType("asin",funType(tupleType([type("star.core*float")]),type("star.core*float"))).
escapeType("acos",funType(tupleType([type("star.core*float")]),type("star.core*float"))).
escapeType("atan",funType(tupleType([type("star.core*float")]),type("star.core*float"))).
escapeType("trunc",funType(tupleType([type("star.core*float")]),type("star.core*float"))).
escapeType("floor",funType(tupleType([type("star.core*float")]),type("star.core*float"))).
escapeType("ceil",funType(tupleType([type("star.core*float")]),type("star.core*float"))).
escapeType("integral",funType(tupleType([type("star.core*float")]),type("star.core*boolean"))).
escapeType("_irand",funType(tupleType([type("star.core*integer")]),type("star.core*integer"))).
escapeType("_ldexp",funType(tupleType([type("star.core*float"),type("star.core*integer")]),type("star.core*float"))).
escapeType("_frexp",funType(tupleType([type("star.core*float")]),tupleType([type("star.core*float"),type("star.core*integer")]))).
escapeType("_modf",funType(tupleType([type("star.core*float")]),tupleType([type("star.core*float"),type("star.core*integer")]))).
escapeType("_band",funType(tupleType([type("star.core*integer"),type("star.core*integer")]),type("star.core*integer"))).
escapeType("_bor",funType(tupleType([type("star.core*integer"),type("star.core*integer")]),type("star.core*integer"))).
escapeType("_bxor",funType(tupleType([type("star.core*integer"),type("star.core*integer")]),type("star.core*integer"))).
escapeType("_blsl",funType(tupleType([type("star.core*integer"),type("star.core*integer")]),type("star.core*integer"))).
escapeType("_blsr",funType(tupleType([type("star.core*integer"),type("star.core*integer")]),type("star.core*integer"))).
escapeType("_basr",funType(tupleType([type("star.core*integer"),type("star.core*integer")]),type("star.core*integer"))).
escapeType("_bnot",funType(tupleType([type("star.core*integer")]),type("star.core*integer"))).
escapeType("_nthb",funType(tupleType([type("star.core*integer"),type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_cell",allType(kVar("t"),funType(tupleType([kVar("t")]),ref(kVar("t"))))).
escapeType("_get",allType(kVar("t"),funType(tupleType([ref(kVar("t"))]),kVar("t")))).
escapeType("_assign",allType(kVar("t"),funType(tupleType([ref(kVar("t")),kVar("t")]),ref(kVar("t"))))).
escapeType("_isDefinedVr",allType(kVar("t"),funType(tupleType([type("star.core*string")]),type("star.core*boolean")))).
escapeType("_definedVr",allType(kVar("t"),funType(tupleType([type("star.core*string")]),kVar("t")))).
escapeType("_defineVr",allType(kVar("t"),funType(tupleType([type("star.core*string"),kVar("t")]),type("star.core*boolean")))).
escapeType("_list_empty",allType(kVar("t"),funType(tupleType([typeExp(tpFun("star.core*list",1),[kVar("t")])]),type("star.core*boolean")))).
escapeType("_list_size",allType(kVar("t"),funType(tupleType([typeExp(tpFun("star.core*list",1),[kVar("t")])]),type("star.core*integer")))).
escapeType("_list_nth",allType(kVar("t"),funType(tupleType([typeExp(tpFun("star.core*list",1),[kVar("t")]),type("star.core*integer")]),kVar("t")))).
escapeType("_list_append",allType(kVar("t"),funType(tupleType([typeExp(tpFun("star.core*list",1),[kVar("t")]),kVar("t")]),typeExp(tpFun("star.core*list",1),[kVar("t")])))).
escapeType("_list_prepend",allType(kVar("t"),funType(tupleType([typeExp(tpFun("star.core*list",1),[kVar("t")]),kVar("t")]),typeExp(tpFun("star.core*list",1),[kVar("t")])))).
escapeType("_list_slice",allType(kVar("t"),funType(tupleType([typeExp(tpFun("star.core*list",1),[kVar("t")]),type("star.core*integer"),type("star.core*integer")]),typeExp(tpFun("star.core*list",1),[kVar("t")])))).
escapeType("_list_front",allType(kVar("t"),funType(tupleType([typeExp(tpFun("star.core*list",1),[kVar("t")]),type("star.core*integer")]),typeExp(tpFun("star.core*list",1),[kVar("t")])))).
escapeType("_list_back",allType(kVar("t"),funType(tupleType([typeExp(tpFun("star.core*list",1),[kVar("t")]),type("star.core*integer")]),typeExp(tpFun("star.core*list",1),[kVar("t")])))).
escapeType("_list_nil",allType(kVar("t"),funType(tupleType([type("star.core*integer")]),typeExp(tpFun("star.core*list",1),[kVar("t")])))).
escapeType("_list_concat",allType(kVar("t"),funType(tupleType([typeExp(tpFun("star.core*list",1),[kVar("t")]),typeExp(tpFun("star.core*list",1),[kVar("t")])]),typeExp(tpFun("star.core*list",1),[kVar("t")])))).
escapeType("_get_file",funType(tupleType([type("star.core*string")]),type("star.core*string"))).
escapeType("_cwd",funType(tupleType([]),type("star.core*string"))).
escapeType("_cd",funType(tupleType([type("star.core*string")]),tpFun("star.core*resultType",0))).
escapeType("_rm",funType(tupleType([type("star.core*string")]),tpFun("star.core*resultType",0))).
escapeType("_mv",funType(tupleType([type("star.core*string"),type("star.core*string")]),tpFun("star.core*resultType",0))).
escapeType("_mkdir",funType(tupleType([type("star.core*string"),type("star.core*integer")]),tpFun("star.core*resultType",0))).
escapeType("_rmdir",funType(tupleType([type("star.core*string")]),tpFun("star.core*resultType",0))).
escapeType("_isdir",funType(tupleType([type("star.core*string")]),type("star.core*boolean"))).
escapeType("_file_chmod",funType(tupleType([type("star.core*string"),type("star.core*integer")]),tpFun("star.core*resultType",0))).
escapeType("_ls",funType(tupleType([type("star.core*string")]),typeExp(tpFun("star.core*list",1),[type("star.core*string")]))).
escapeType("_file_mode",funType(tupleType([type("star.core*string")]),type("star.core*integer"))).
escapeType("_file_present",funType(tupleType([type("star.core*string")]),type("star.core*boolean"))).
escapeType("_file_type",funType(tupleType([type("star.core*string")]),type("star.core*integer"))).
escapeType("_file_size",funType(tupleType([type("star.core*string")]),type("star.core*integer"))).
escapeType("_file_modified",funType(tupleType([type("star.core*string")]),type("star.core*integer"))).
escapeType("_file_date",funType(tupleType([type("star.core*string")]),tupleType([type("star.core*integer"),type("star.core*integer"),type("star.core*integer")]))).
escapeType("_openInFile",funType(tupleType([type("star.core*string"),type("star.core*integer")]),type("star.io*fileHandle"))).
escapeType("_openOutFile",funType(tupleType([type("star.core*string"),type("star.core*integer")]),type("star.io*fileHandle"))).
escapeType("_openAppendFile",funType(tupleType([type("star.core*string"),type("star.core*integer")]),type("star.io*fileHandle"))).
escapeType("_openAppendIOFile",funType(tupleType([type("star.core*string"),type("star.core*integer")]),type("star.io*fileHandle"))).
escapeType("_popen",funType(tupleType([type("star.core*string"),typeExp(tpFun("star.core*list",1),[type("star.core*string")]),typeExp(tpFun("star.core*list",1),[tupleType([type("star.core*string"),type("star.core*string")])])]),tupleType([type("star.io*fileHandle"),type("star.io*fileHandle"),type("star.io*fileHandle")]))).
escapeType("_close",funType(tupleType([type("star.io*fileHandle")]),tpFun("star.core*resultType",0))).
escapeType("_end_of_file",funType(tupleType([type("star.io*fileHandle")]),type("star.core*boolean"))).
escapeType("_ready_to_read",funType(tupleType([type("star.io*fileHandle")]),type("star.core*boolean"))).
escapeType("_ready_to_write",funType(tupleType([type("star.io*fileHandle")]),type("star.core*boolean"))).
escapeType("_inchars",funType(tupleType([type("star.io*fileHandle"),type("star.core*integer")]),type("star.core*string"))).
escapeType("_inbytes",funType(tupleType([type("star.io*fileHandle"),type("star.core*integer")]),typeExp(tpFun("star.core*list",1),[type("star.core*integer")]))).
escapeType("_inchar",funType(tupleType([type("star.io*fileHandle")]),type("star.core*integer"))).
escapeType("_inbyte",funType(tupleType([type("star.io*fileHandle")]),type("star.core*integer"))).
escapeType("_inline",funType(tupleType([type("star.io*fileHandle")]),type("star.core*string"))).
escapeType("_intext",funType(tupleType([type("star.io*fileHandle"),type("star.core*string")]),type("star.core*string"))).
escapeType("_outchar",funType(tupleType([type("star.io*fileHandle"),type("star.core*integer")]),tpFun("star.core*resultType",0))).
escapeType("_outbyte",funType(tupleType([type("star.io*fileHandle"),type("star.core*integer")]),tpFun("star.core*resultType",0))).
escapeType("_outbytes",funType(tupleType([type("star.io*fileHandle"),typeExp(tpFun("star.core*list",1),[type("star.core*integer")])]),tpFun("star.core*resultType",0))).
escapeType("_outtext",funType(tupleType([type("star.io*fileHandle"),type("star.core*string")]),tpFun("star.core*resultType",0))).
escapeType("_stdfile",funType(tupleType([type("star.core*integer")]),type("star.io*fileHandle"))).
escapeType("_fposition",funType(tupleType([type("star.io*fileHandle")]),type("star.core*integer"))).
escapeType("_fseek",funType(tupleType([type("star.io*fileHandle"),type("star.core*integer")]),tpFun("star.core*resultType",0))).
escapeType("_flush",funType(tupleType([type("star.io*fileHandle")]),tpFun("star.core*resultType",0))).
escapeType("_flushall",funType(tupleType([]),voidType)).
escapeType("_setfileencoding",funType(tupleType([type("star.io*fileHandle"),type("star.core*integer")]),tpFun("star.core*resultType",0))).
escapeType("_install_pkg",funType(tupleType([type("star.core*string")]),typeExp(tpFun("star.core*list",1),[tupleType([type("star.core*string"),type("star.core*string")])]))).
escapeType("_pkg_is_present",funType(tupleType([type("star.core*string"),type("star.core*string")]),type("star.core*boolean"))).
escapeType("_logmsg",funType(tupleType([type("star.core*string")]),tpFun("star.core*resultType",0))).
escapeType("_connect",funType(tupleType([type("star.core*string"),type("star.core*integer"),type("star.core*integer")]),tupleType([type("star.io*fileHandle"),type("star.io*fileHandle")]))).
escapeType("_listen",funType(tupleType([type("star.core*integer")]),type("star.io*fileHandle"))).
escapeType("_accept",funType(tupleType([type("star.io*fileHandle")]),tupleType([type("star.io*fileHandle"),type("star.io*fileHandle"),type("star.core*string"),type("star.core*integer"),type("star.core*string")]))).
escapeType("_hosttoip",funType(tupleType([type("star.core*string")]),typeExp(tpFun("star.core*list",1),[type("star.core*string")]))).
escapeType("_iptohost",funType(tupleType([type("star.core*string")]),type("star.core*string"))).
escapeType("_delay",funType(tupleType([type("star.core*float")]),tpFun("star.core*resultType",0))).
escapeType("_sleep",funType(tupleType([type("star.core*float")]),tpFun("star.core*resultType",0))).
escapeType("_now",funType(tupleType([]),type("star.core*float"))).
escapeType("_today",funType(tupleType([]),type("star.core*float"))).
escapeType("_ticks",funType(tupleType([]),type("star.core*float"))).
escapeType("_time2date",funType(tupleType([type("star.core*float")]),tupleType([type("star.core*integer"),type("star.core*integer"),type("star.core*integer"),type("star.core*integer"),type("star.core*integer"),type("star.core*integer"),type("star.core*float"),type("star.core*integer"),type("star.core*integer")]))).
escapeType("_time2utc",funType(tupleType([type("star.core*float")]),tupleType([type("star.core*integer"),type("star.core*integer"),type("star.core*integer"),type("star.core*integer"),type("star.core*integer"),type("star.core*integer"),type("star.core*float"),type("star.core*integer"),type("star.core*integer")]))).
escapeType("_date2time",funType(tupleType([type("star.core*integer"),type("star.core*integer"),type("star.core*integer"),type("star.core*integer"),type("star.core*integer"),type("star.core*float"),type("star.core*integer")]),type("star.core*float"))).
escapeType("_utc2time",funType(tupleType([type("star.core*integer"),type("star.core*integer"),type("star.core*integer"),type("star.core*integer"),type("star.core*integer"),type("star.core*float"),type("star.core*integer")]),type("star.core*float"))).
escapeType("_isCcChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_isCfChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_isCnChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_isCoChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_isCsChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_isLlChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_isLmChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_isLoChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_isLtChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_isLuChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_isMcChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_isMeChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_isMnChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_isNdChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_isNlChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_isNoChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_isPcChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_isPdChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_isPeChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_isPfChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_isPiChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_isPoChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_isPsChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_isScChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_isSkChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_isSmChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_isSoChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_isZlChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_isZpChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_isZsChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_isLetterChar",funType(tupleType([type("star.core*integer")]),type("star.core*boolean"))).
escapeType("_digitCode",funType(tupleType([type("star.core*integer")]),type("star.core*integer"))).
escapeType("_int2str",funType(tupleType([type("star.core*integer"),type("star.core*integer"),type("star.core*integer"),type("star.core*integer")]),type("star.core*string"))).
escapeType("_flt2str",funType(tupleType([type("star.core*float"),type("star.core*integer"),type("star.core*integer"),type("star.core*integer"),type("star.core*boolean")]),type("star.core*string"))).
escapeType("_int_format",funType(tupleType([type("star.core*integer"),type("star.core*string")]),type("star.core*string"))).
escapeType("_flt_format",funType(tupleType([type("star.core*float"),type("star.core*string")]),type("star.core*string"))).
escapeType("_str2flt",funType(tupleType([type("star.core*string")]),type("star.core*float"))).
escapeType("_str2int",funType(tupleType([type("star.core*string")]),type("star.core*integer"))).
escapeType("_str_eq",funType(tupleType([type("star.core*string"),type("star.core*string")]),type("star.core*boolean"))).
escapeType("_str_lt",funType(tupleType([type("star.core*string"),type("star.core*string")]),type("star.core*boolean"))).
escapeType("_str_ge",funType(tupleType([type("star.core*string"),type("star.core*string")]),type("star.core*boolean"))).
escapeType("_str_hash",funType(tupleType([type("star.core*string")]),type("star.core*integer"))).
escapeType("_str_len",funType(tupleType([type("star.core*string")]),type("star.core*integer"))).
escapeType("_str_gen",funType(tupleType([type("star.core*string")]),type("star.core*string"))).
escapeType("_stringOf",allType(kVar("t"),funType(tupleType([kVar("t"),type("star.core*integer")]),type("star.core*string")))).
escapeType("_explode",funType(tupleType([type("star.core*string")]),typeExp(tpFun("star.core*list",1),[type("star.core*integer")]))).
escapeType("_implode",funType(tupleType([typeExp(tpFun("star.core*list",1),[type("star.core*integer")])]),type("star.core*string"))).
escapeType("_str_find",funType(tupleType([type("star.core*string"),type("star.core*string"),type("star.core*integer")]),type("star.core*integer"))).
escapeType("_sub_str",funType(tupleType([type("star.core*string"),type("star.core*integer"),type("star.core*integer")]),type("star.core*string"))).
escapeType("_str_split",funType(tupleType([type("star.core*string"),type("star.core*integer")]),tupleType([type("star.core*string"),type("star.core*string")]))).
escapeType("_str_concat",funType(tupleType([type("star.core*string"),type("star.core*string")]),type("star.core*string"))).
escapeType("_str_start",funType(tupleType([type("star.core*string"),type("star.core*string")]),type("star.core*boolean"))).
escapeType("_str_multicat",funType(tupleType([typeExp(tpFun("star.core*list",1),[type("star.core*string")])]),type("star.core*string"))).
escapeType("_getenv",funType(tupleType([type("star.core*string"),type("star.core*string")]),type("star.core*string"))).
escapeType("_setenv",funType(tupleType([type("star.core*string"),type("star.core*string")]),tpFun("star.core*resultType",0))).
escapeType("_envir",funType(tupleType([]),typeExp(tpFun("star.core*list",1),[tupleType([type("star.core*string"),type("star.core*string")])]))).
escapeType("_getlogin",funType(tupleType([]),type("star.core*string"))).
escapeType("_fork",funType(tupleType([funType(tupleType([]),tpFun("star.core*resultType",0)),tupleType([type("star.core*string")])]),type("star.thread*thread"))).
escapeType("_thread",funType(tupleType([]),type("star.thread*thread"))).
escapeType("_kill",funType(tupleType([type("star.thread*thread")]),tpFun("star.core*resultType",0))).
escapeType("_thread_state",funType(tupleType([type("star.thread*thread")]),type("star.thread*processState"))).
escapeType("_waitfor",funType(tupleType([type("star.thread*thread")]),tpFun("star.core*resultType",0))).
escapeType("_shell",funType(tupleType([type("star.core*string"),typeExp(tpFun("star.core*list",1),[type("star.core*string")]),typeExp(tpFun("star.core*list",1),[tupleType([type("star.core*string"),type("star.core*string")])])]),type("star.core*integer"))).
escapeType("_newLock",funType(tupleType([]),type("star.thread*lock"))).
escapeType("_acquireLock",funType(tupleType([type("star.thread*lock"),type("star.core*float")]),tpFun("star.core*resultType",0))).
escapeType("_waitLock",funType(tupleType([type("star.thread*lock"),type("star.core*float")]),tpFun("star.core*resultType",0))).
escapeType("_releaseLock",funType(tupleType([type("star.thread*lock")]),tpFun("star.core*resultType",0))).
escapeType("_ins_debug",funType(tupleType([]),voidType)).
escapeType("_stackTrace",funType(tupleType([]),voidType)).
escapeType("_assert",funType(tupleType([type("star.core*boolean"),type("star.core*string")]),voidType)).
isEscape("_exit").
isEscape("_command_line").
isEscape("_abort").
isEscape("_identical").
isEscape("_defined").
isEscape("_int_plus").
isEscape("_int_minus").
isEscape("_int_times").
isEscape("_int_div").
isEscape("_int_mod").
isEscape("_int_hash").
isEscape("_flt_plus").
isEscape("_flt_minus").
isEscape("_flt_times").
isEscape("_flt_div").
isEscape("_flt_mod").
isEscape("_int_abs").
isEscape("_flt_abs").
isEscape("_int_eq").
isEscape("_int_lt").
isEscape("_int_ge").
isEscape("_flt_eq").
isEscape("_flt_lt").
isEscape("_flt_ge").
isEscape("_int2flt").
isEscape("_flt2int").
isEscape("_flt_hash").
isEscape("_flt_pwr").
isEscape("sqrt").
isEscape("_exp").
isEscape("log").
isEscape("log10").
isEscape("pi").
isEscape("sin").
isEscape("cos").
isEscape("tan").
isEscape("asin").
isEscape("acos").
isEscape("atan").
isEscape("trunc").
isEscape("floor").
isEscape("ceil").
isEscape("integral").
isEscape("_irand").
isEscape("_ldexp").
isEscape("_frexp").
isEscape("_modf").
isEscape("_band").
isEscape("_bor").
isEscape("_bxor").
isEscape("_blsl").
isEscape("_blsr").
isEscape("_basr").
isEscape("_bnot").
isEscape("_nthb").
isEscape("_cell").
isEscape("_get").
isEscape("_assign").
isEscape("_isDefinedVr").
isEscape("_definedVr").
isEscape("_defineVr").
isEscape("_list_empty").
isEscape("_list_size").
isEscape("_list_nth").
isEscape("_list_append").
isEscape("_list_prepend").
isEscape("_list_slice").
isEscape("_list_front").
isEscape("_list_back").
isEscape("_list_nil").
isEscape("_list_concat").
isEscape("_get_file").
isEscape("_cwd").
isEscape("_cd").
isEscape("_rm").
isEscape("_mv").
isEscape("_mkdir").
isEscape("_rmdir").
isEscape("_isdir").
isEscape("_file_chmod").
isEscape("_ls").
isEscape("_file_mode").
isEscape("_file_present").
isEscape("_file_type").
isEscape("_file_size").
isEscape("_file_modified").
isEscape("_file_date").
isEscape("_openInFile").
isEscape("_openOutFile").
isEscape("_openAppendFile").
isEscape("_openAppendIOFile").
isEscape("_popen").
isEscape("_close").
isEscape("_end_of_file").
isEscape("_ready_to_read").
isEscape("_ready_to_write").
isEscape("_inchars").
isEscape("_inbytes").
isEscape("_inchar").
isEscape("_inbyte").
isEscape("_inline").
isEscape("_intext").
isEscape("_outchar").
isEscape("_outbyte").
isEscape("_outbytes").
isEscape("_outtext").
isEscape("_stdfile").
isEscape("_fposition").
isEscape("_fseek").
isEscape("_flush").
isEscape("_flushall").
isEscape("_setfileencoding").
isEscape("_install_pkg").
isEscape("_pkg_is_present").
isEscape("_logmsg").
isEscape("_connect").
isEscape("_listen").
isEscape("_accept").
isEscape("_hosttoip").
isEscape("_iptohost").
isEscape("_delay").
isEscape("_sleep").
isEscape("_now").
isEscape("_today").
isEscape("_ticks").
isEscape("_time2date").
isEscape("_time2utc").
isEscape("_date2time").
isEscape("_utc2time").
isEscape("_isCcChar").
isEscape("_isCfChar").
isEscape("_isCnChar").
isEscape("_isCoChar").
isEscape("_isCsChar").
isEscape("_isLlChar").
isEscape("_isLmChar").
isEscape("_isLoChar").
isEscape("_isLtChar").
isEscape("_isLuChar").
isEscape("_isMcChar").
isEscape("_isMeChar").
isEscape("_isMnChar").
isEscape("_isNdChar").
isEscape("_isNlChar").
isEscape("_isNoChar").
isEscape("_isPcChar").
isEscape("_isPdChar").
isEscape("_isPeChar").
isEscape("_isPfChar").
isEscape("_isPiChar").
isEscape("_isPoChar").
isEscape("_isPsChar").
isEscape("_isScChar").
isEscape("_isSkChar").
isEscape("_isSmChar").
isEscape("_isSoChar").
isEscape("_isZlChar").
isEscape("_isZpChar").
isEscape("_isZsChar").
isEscape("_isLetterChar").
isEscape("_digitCode").
isEscape("_int2str").
isEscape("_flt2str").
isEscape("_int_format").
isEscape("_flt_format").
isEscape("_str2flt").
isEscape("_str2int").
isEscape("_str_eq").
isEscape("_str_lt").
isEscape("_str_ge").
isEscape("_str_hash").
isEscape("_str_len").
isEscape("_str_gen").
isEscape("_stringOf").
isEscape("_explode").
isEscape("_implode").
isEscape("_str_find").
isEscape("_sub_str").
isEscape("_str_split").
isEscape("_str_concat").
isEscape("_str_start").
isEscape("_str_multicat").
isEscape("_getenv").
isEscape("_setenv").
isEscape("_envir").
isEscape("_getlogin").
isEscape("_fork").
isEscape("_thread").
isEscape("_kill").
isEscape("_thread_state").
isEscape("_waitfor").
isEscape("_shell").
isEscape("_newLock").
isEscape("_acquireLock").
isEscape("_waitLock").
isEscape("_releaseLock").
isEscape("_ins_debug").
isEscape("_stackTrace").
isEscape("_assert").
