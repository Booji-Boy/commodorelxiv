///Protects a datum from being VV'd or spawned through admin manipulation
#ifndef TESTING
#define GENERAL_PROTECT_DATUM(Path)\
##Path/can_vv_get(var_name){\
	return FALSE;\
}\
##Path/vv_edit_var(var_name, var_value){\
	return FALSE;\
}\
##Path/CanProcCall(procname){\
	return FALSE;\
}\
##Path/Read(savefile/savefile){\
<<<<<<< HEAD
	del(src);\
=======
	qdel(src);\
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
}\
##Path/Write(savefile/savefile){\
	return;\
}
#else
#define GENERAL_PROTECT_DATUM(Path)
#endif
<<<<<<< HEAD
// we del instead of qdel because for security reasons we must ensure the datum does not exist if Read is called. qdel will not enforce this.
=======
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
