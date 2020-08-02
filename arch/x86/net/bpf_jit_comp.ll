; ModuleID = '/home/lukenels/repo/linux/arch/x86/net/bpf_jit_comp.c'
source_filename = "/home/lukenels/repo/linux/arch/x86/net/bpf_jit_comp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.mutex = type { %struct.atomic64_t, %struct.spinlock, %struct.optimistic_spin_queue, %struct.list_head, i8*, %struct.lockdep_map }
%struct.atomic64_t = type { i64 }
%struct.spinlock = type { %union.anon }
%union.anon = type { %struct.raw_spinlock }
%struct.raw_spinlock = type { %struct.qspinlock, i32, i32, i8*, %struct.lockdep_map }
%struct.qspinlock = type { %union.anon.0 }
%union.anon.0 = type { %struct.atomic_t }
%struct.atomic_t = type { i32 }
%struct.optimistic_spin_queue = type { %struct.atomic_t }
%struct.list_head = type { %struct.list_head*, %struct.list_head* }
%struct.lockdep_map = type { %struct.lock_class_key*, [2 x %struct.lock_class*], i8*, i16, i16, i32, i64 }
%struct.lock_class_key = type { %union.anon.2 }
%union.anon.2 = type { %struct.hlist_node }
%struct.hlist_node = type { %struct.hlist_node*, %struct.hlist_node** }
%struct.lock_class = type { %struct.hlist_node, %struct.list_head, %struct.list_head, %struct.list_head, %struct.lockdep_subclass_key*, i32, i32, i64, [9 x %struct.lock_trace*], i32, i8*, i16, i16, [4 x i64], [4 x i64] }
%struct.lockdep_subclass_key = type { i8 }
%struct.lock_trace = type opaque
%struct.kmem_cache = type opaque
%struct.task_struct = type { %struct.thread_info, i64, i8*, %struct.refcount_struct, i32, i32, %struct.llist_node, i32, i32, i32, i32, i64, %struct.task_struct*, i32, i32, i32, i32, i32, i32, i32, %struct.sched_class*, %struct.sched_entity, %struct.sched_rt_entity, %struct.task_group*, %struct.sched_dl_entity, [2 x %struct.uclamp_se], [2 x %struct.uclamp_se], %struct.hlist_head, i32, i32, i32, %struct.cpumask*, %struct.cpumask, i64, i8, i8, i32, %struct.list_head, i32, i32, %union.rcu_special, i8, %struct.list_head, %struct.sched_info, %struct.list_head, %struct.plist_node, %struct.rb_node, %struct.mm_struct*, %struct.mm_struct*, %struct.vmacache, %struct.task_rss_stat, i32, i32, i32, i32, i64, i32, i8, [3 x i8], i16, i64, %struct.restart_block, i32, i32, i64, %struct.task_struct*, %struct.task_struct*, %struct.list_head, %struct.list_head, %struct.task_struct*, %struct.list_head, %struct.list_head, %struct.pid*, [4 x %struct.hlist_node], %struct.list_head, %struct.list_head, %struct.completion*, i32*, i32*, i64, i64, i64, %struct.prev_cputime, i64, i64, i64, i64, i64, i64, %struct.posix_cputimers, %struct.cred*, %struct.cred*, %struct.cred*, %struct.key*, [16 x i8], %struct.nameidata*, %struct.sysv_sem, %struct.sysv_shm, i64, i64, %struct.fs_struct*, %struct.files_struct*, %struct.nsproxy*, %struct.signal_struct*, %struct.sighand_struct*, %struct.sigset_t, %struct.sigset_t, %struct.sigset_t, %struct.sigpending, i64, i64, i32, %struct.callback_head*, %struct.audit_context*, %struct.kuid_t, i32, %struct.seccomp, i64, i64, %struct.spinlock, %struct.raw_spinlock, %struct.wake_q_node, %struct.rb_root_cached, %struct.task_struct*, %struct.rt_mutex_waiter*, %struct.mutex_waiter*, i32, i32, i32, i64, i64, i32, i32, i32, i32, i64, i64, i64, i32, i32, i32, i32, i32, i64, i32, i32, [48 x %struct.held_lock], i32, i8*, %struct.bio_list*, %struct.blk_plug*, %struct.reclaim_state*, %struct.backing_dev_info*, %struct.io_context*, %struct.capture_control*, i64, %struct.kernel_siginfo*, %struct.task_io_accounting, i32, i64, i64, i64, %struct.nodemask_t, %struct.seqcount, i32, i32, %struct.css_set*, %struct.list_head, i32, i32, %struct.robust_list_head*, %struct.compat_robust_list_head*, %struct.list_head, %struct.futex_pi_state*, %struct.mutex, i32, [2 x %struct.perf_event_context*], %struct.mutex, %struct.list_head, %struct.mempolicy*, i16, i16, i32, i32, i32, i32, i64, i64, i64, i64, %struct.callback_head, %struct.numa_group*, i64*, i64, [3 x i64], i64, %struct.rseq*, i32, i64, %struct.tlbflush_unmap_batch, %union.anon.104, %struct.pipe_inode_info*, %struct.page_frag, %struct.task_delay_info*, i32, i32, i32, i32, i64, i32, [32 x %struct.latency_record], i64, i64, i32, i32, i32, %struct.ftrace_ret_stack*, i64, %struct.atomic_t, %struct.atomic_t, i64, i64, i32, i32, i8*, %struct.kcov*, i64, i32, i32, %struct.mem_cgroup*, i32, i32, i32, %struct.mem_cgroup*, %struct.request_queue*, %struct.uprobe_task*, i32, i32, i64, i32, %struct.task_struct*, %struct.vm_struct*, %struct.refcount_struct, i32, i8*, i64, i64, %struct.callback_head, [48 x i8], %struct.thread_struct }
%struct.thread_info = type { i64, i32 }
%struct.llist_node = type { %struct.llist_node* }
%struct.sched_class = type opaque
%struct.sched_entity = type { %struct.load_weight, %struct.rb_node, %struct.list_head, i32, i64, i64, i64, i64, i64, %struct.sched_statistics, i32, %struct.sched_entity*, %struct.cfs_rq*, %struct.cfs_rq*, i64, [24 x i8], %struct.sched_avg }
%struct.load_weight = type { i64, i32 }
%struct.sched_statistics = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.cfs_rq = type opaque
%struct.sched_avg = type { i64, i64, i64, i32, i32, i64, i64, i64, %struct.util_est }
%struct.util_est = type { i32, i32 }
%struct.sched_rt_entity = type { %struct.list_head, i64, i64, i32, i16, i16, %struct.sched_rt_entity*, %struct.sched_rt_entity*, %struct.rt_rq*, %struct.rt_rq* }
%struct.rt_rq = type opaque
%struct.task_group = type opaque
%struct.sched_dl_entity = type { %struct.rb_node, i64, i64, i64, i64, i64, i64, i64, i32, i8, %struct.hrtimer, %struct.hrtimer }
%struct.hrtimer = type { %struct.timerqueue_node, i64, i32 (%struct.hrtimer*)*, %struct.hrtimer_clock_base*, i8, i8, i8, i8 }
%struct.timerqueue_node = type { %struct.rb_node, i64 }
%struct.hrtimer_clock_base = type { %struct.hrtimer_cpu_base*, i32, i32, %struct.seqcount, %struct.hrtimer*, %struct.timerqueue_head, i64 ()*, i64, [16 x i8] }
%struct.hrtimer_cpu_base = type { %struct.raw_spinlock, i32, i32, i32, i8, i32, i16, i16, i32, i64, %struct.hrtimer*, i64, %struct.hrtimer*, [56 x i8], [8 x %struct.hrtimer_clock_base] }
%struct.timerqueue_head = type { %struct.rb_root_cached }
%struct.uclamp_se = type { i16, [2 x i8] }
%struct.hlist_head = type { %struct.hlist_node* }
%struct.cpumask = type { [128 x i64] }
%union.rcu_special = type { i32 }
%struct.sched_info = type { i64, i64, i64, i64 }
%struct.plist_node = type { i32, %struct.list_head, %struct.list_head }
%struct.rb_node = type { i64, %struct.rb_node*, %struct.rb_node* }
%struct.mm_struct = type { %struct.anon.29, [0 x i64] }
%struct.anon.29 = type { %struct.vm_area_struct*, %struct.rb_root, i64, i64 (%struct.file*, i64, i64, i64, i64)*, i64, i64, i64, i64, i64, i64, %struct.pgd_t*, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic64_t, i32, %struct.spinlock, %struct.rw_semaphore, %struct.list_head, i64, i64, i64, i64, %struct.atomic64_t, i64, i64, i64, i64, %struct.spinlock, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, [46 x i64], %struct.mm_rss_stat, %struct.linux_binfmt*, %struct.mm_context_t, i64, %struct.core_state*, %struct.spinlock, %struct.kioctx_table*, %struct.task_struct*, %struct.user_namespace*, %struct.file*, %struct.mmu_notifier_subscriptions*, i64, i64, i32, %struct.atomic_t, i8, %struct.uprobes_state, %struct.atomic64_t, %struct.work_struct }
%struct.vm_area_struct = type { i64, i64, %struct.vm_area_struct*, %struct.vm_area_struct*, %struct.rb_node, i64, %struct.mm_struct*, %struct.pgprot, i64, %struct.anon.112, %struct.list_head, %struct.anon_vma*, %struct.vm_operations_struct*, i64, %struct.file*, i8*, %struct.atomic64_t, %struct.mempolicy*, %struct.vm_userfaultfd_ctx }
%struct.pgprot = type { i64 }
%struct.anon.112 = type { %struct.rb_node, i64 }
%struct.anon_vma = type opaque
%struct.vm_operations_struct = type { void (%struct.vm_area_struct*)*, void (%struct.vm_area_struct*)*, i32 (%struct.vm_area_struct*, i64)*, i32 (%struct.vm_area_struct*)*, i32 (%struct.vm_fault*)*, i32 (%struct.vm_fault*, i32)*, void (%struct.vm_fault*, i64, i64)*, i64 (%struct.vm_area_struct*)*, i32 (%struct.vm_fault*)*, i32 (%struct.vm_fault*)*, i32 (%struct.vm_area_struct*, i64, i8*, i32, i32)*, i8* (%struct.vm_area_struct*)*, i32 (%struct.vm_area_struct*, %struct.mempolicy*)*, %struct.mempolicy* (%struct.vm_area_struct*, i64)*, %struct.page* (%struct.vm_area_struct*, i64)* }
%struct.vm_fault = type { %struct.vm_area_struct*, i32, i32, i64, i64, %struct.pmd_t*, %struct.pud_t*, %struct.pte_t, %struct.page*, %struct.page*, %struct.pte_t*, %struct.spinlock*, %struct.page* }
%struct.pmd_t = type { i64 }
%struct.pud_t = type { i64 }
%struct.pte_t = type { i64 }
%struct.page = type { i64, %union.anon.72, %union.anon.88, %struct.atomic_t, %struct.mem_cgroup* }
%union.anon.72 = type { %struct.anon.73 }
%struct.anon.73 = type { %struct.list_head, %struct.address_space*, i64, i64 }
%struct.address_space = type { %struct.inode*, %struct.xarray, i32, %struct.atomic_t, %struct.atomic_t, %struct.rb_root_cached, %struct.rw_semaphore, i64, i64, i64, %struct.address_space_operations*, i64, i32, %struct.spinlock, %struct.list_head, i8* }
%struct.inode = type { i16, i16, %struct.kuid_t, %struct.kgid_t, i32, %struct.posix_acl*, %struct.posix_acl*, %struct.inode_operations*, %struct.super_block*, %struct.address_space*, i8*, i64, %union.anon.116, i32, i64, %struct.timespec64, %struct.timespec64, %struct.timespec64, %struct.spinlock, i16, i8, i8, i64, i64, %struct.rw_semaphore, i64, i64, %struct.hlist_node, %struct.list_head, %struct.bdi_writeback*, i32, i16, i16, %struct.list_head, %struct.list_head, %struct.list_head, %union.anon.117, %struct.atomic64_t, %struct.atomic64_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %union.anon.118, %struct.file_lock_context*, %struct.address_space, %struct.list_head, %union.anon.121, i32, i32, %struct.fsnotify_mark_connector*, %struct.fscrypt_info*, %struct.fsverity_info*, i8* }
%struct.kgid_t = type { i32 }
%struct.posix_acl = type opaque
%struct.inode_operations = type { %struct.dentry* (%struct.inode*, %struct.dentry*, i32)*, i8* (%struct.dentry*, %struct.inode*, %struct.delayed_call*)*, i32 (%struct.inode*, i32)*, %struct.posix_acl* (%struct.inode*, i32)*, i32 (%struct.dentry*, i8*, i32)*, i32 (%struct.inode*, %struct.dentry*, i16, i1)*, i32 (%struct.dentry*, %struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*, i8*)*, i32 (%struct.inode*, %struct.dentry*, i16)*, i32 (%struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*, i16, i32)*, i32 (%struct.inode*, %struct.dentry*, %struct.inode*, %struct.dentry*, i32)*, i32 (%struct.dentry*, %struct.iattr*)*, i32 (%struct.path*, %struct.kstat*, i32, i32)*, i64 (%struct.dentry*, i8*, i64)*, i32 (%struct.inode*, %struct.fiemap_extent_info*, i64, i64)*, i32 (%struct.inode*, %struct.timespec64*, i32)*, i32 (%struct.inode*, %struct.dentry*, %struct.file*, i32, i16)*, i32 (%struct.inode*, %struct.dentry*, i16)*, i32 (%struct.inode*, %struct.posix_acl*, i32)*, [24 x i8] }
%struct.dentry = type { i32, %struct.seqcount, %struct.hlist_bl_node, %struct.dentry*, %struct.qstr, %struct.inode*, [32 x i8], %struct.lockref, %struct.dentry_operations*, %struct.super_block*, i64, i8*, %union.anon.124, %struct.list_head, %struct.list_head, %union.anon.125 }
%struct.hlist_bl_node = type { %struct.hlist_bl_node*, %struct.hlist_bl_node** }
%struct.qstr = type { %union.anon.27, i8* }
%union.anon.27 = type { i64 }
%struct.lockref = type { %union.anon.122 }
%union.anon.122 = type { %struct.anon.123 }
%struct.anon.123 = type { %struct.spinlock, i32 }
%struct.dentry_operations = type { i32 (%struct.dentry*, i32)*, i32 (%struct.dentry*, i32)*, i32 (%struct.dentry*, %struct.qstr*)*, i32 (%struct.dentry*, i32, i8*, %struct.qstr*)*, i32 (%struct.dentry*)*, i32 (%struct.dentry*)*, void (%struct.dentry*)*, void (%struct.dentry*)*, void (%struct.dentry*, %struct.inode*)*, i8* (%struct.dentry*, i8*, i32)*, %struct.vfsmount* (%struct.path*)*, i32 (%struct.path*, i1)*, %struct.dentry* (%struct.dentry*, %struct.inode*)*, [24 x i8] }
%struct.vfsmount = type opaque
%struct.path = type { %struct.vfsmount*, %struct.dentry* }
%union.anon.124 = type { %struct.list_head }
%union.anon.125 = type { %struct.hlist_node }
%struct.delayed_call = type { void (i8*)*, i8* }
%struct.iattr = type { i32, i16, %struct.kuid_t, %struct.kgid_t, i64, %struct.timespec64, %struct.timespec64, %struct.timespec64, %struct.file* }
%struct.kstat = type { i32, i16, i32, i32, i64, i64, i64, i32, i32, %struct.kuid_t, %struct.kgid_t, i64, %struct.timespec64, %struct.timespec64, %struct.timespec64, %struct.timespec64, i64, i64 }
%struct.fiemap_extent_info = type opaque
%struct.super_block = type { %struct.list_head, i32, i8, i64, i64, %struct.file_system_type*, %struct.super_operations*, %struct.dquot_operations*, %struct.quotactl_ops*, %struct.export_operations*, i64, i64, i64, %struct.dentry*, %struct.rw_semaphore, i32, %struct.atomic_t, i8*, %struct.xattr_handler**, %struct.fscrypt_operations*, %struct.key*, %struct.fsverity_operations*, %struct.hlist_bl_head, %struct.list_head, %struct.block_device*, %struct.backing_dev_info*, %struct.mtd_info*, %struct.hlist_node, i32, %struct.quota_info, %struct.sb_writers, i8*, i32, i64, i64, i32, %struct.fsnotify_mark_connector*, [32 x i8], %struct.uuid_t, i32, i32, %struct.mutex, i8*, %struct.dentry_operations*, i32, %struct.shrinker, %struct.atomic64_t, %struct.atomic64_t, i32, i32, %struct.workqueue_struct*, %struct.hlist_head, %struct.user_namespace*, %struct.list_lru, %struct.list_lru, %struct.callback_head, %struct.work_struct, %struct.mutex, i32, [20 x i8], %struct.spinlock, %struct.list_head, %struct.spinlock, %struct.list_head, [16 x i8] }
%struct.file_system_type = type { i8*, i32, i32 (%struct.fs_context*)*, %struct.fs_parameter_spec*, %struct.dentry* (%struct.file_system_type*, i32, i8*, i8*)*, void (%struct.super_block*)*, %struct.module*, %struct.file_system_type*, %struct.hlist_head, %struct.lock_class_key, %struct.lock_class_key, %struct.lock_class_key, [3 x %struct.lock_class_key], %struct.lock_class_key, %struct.lock_class_key, %struct.lock_class_key }
%struct.fs_context = type opaque
%struct.fs_parameter_spec = type opaque
%struct.module = type { i32, %struct.list_head, [56 x i8], %struct.module_kobject, %struct.module_attribute*, i8*, i8*, %struct.kobject*, %struct.kernel_symbol*, i32*, i32, %struct.mutex, %struct.kernel_param*, i32, i32, %struct.kernel_symbol*, i32*, %struct.kernel_symbol*, i32*, i32, i32, %struct.kernel_symbol*, i32*, i8, i8, %struct.kernel_symbol*, i32*, i32, i32, %struct.exception_table_entry*, i32 ()*, %struct.module_layout, %struct.module_layout, %struct.mod_arch_specific, i64, i32, %struct.list_head, %struct.bug_entry*, %struct.mod_kallsyms*, %struct.mod_kallsyms, %struct.module_sect_attrs*, %struct.module_notes_attrs*, i8*, i8*, i32, i8*, i32, i32, i32*, i32, %struct.srcu_struct**, i32, %struct.bpf_raw_event_map*, %struct.jump_entry*, i32, i32, i8**, %struct.trace_event_call**, i32, %struct.trace_eval_map**, i32, i32, i64*, i8*, i32, i64*, i32, i8, i8, %struct.klp_modinfo*, %struct.list_head, %struct.list_head, void ()*, %struct.atomic_t, void ()**, i32, %struct.error_injection_entry*, i32, [36 x i8] }
%struct.module_kobject = type { %struct.kobject, %struct.module*, %struct.kobject*, %struct.module_param_attrs*, %struct.completion* }
%struct.kobject = type { i8*, %struct.list_head, %struct.kobject*, %struct.kset*, %struct.kobj_type*, %struct.kernfs_node*, %struct.kref, %struct.delayed_work, i8 }
%struct.kset = type { %struct.list_head, %struct.spinlock, %struct.kobject, %struct.kset_uevent_ops* }
%struct.kset_uevent_ops = type { i32 (%struct.kset*, %struct.kobject*)*, i8* (%struct.kset*, %struct.kobject*)*, i32 (%struct.kset*, %struct.kobject*, %struct.kobj_uevent_env*)* }
%struct.kobj_uevent_env = type { [3 x i8*], [64 x i8*], i32, [2048 x i8], i32 }
%struct.kobj_type = type { void (%struct.kobject*)*, %struct.sysfs_ops*, %struct.attribute**, %struct.attribute_group**, %struct.kobj_ns_type_operations* (%struct.kobject*)*, i8* (%struct.kobject*)*, void (%struct.kobject*, %struct.kuid_t*, %struct.kgid_t*)* }
%struct.sysfs_ops = type { i64 (%struct.kobject*, %struct.attribute*, i8*)*, i64 (%struct.kobject*, %struct.attribute*, i8*, i64)* }
%struct.attribute = type { i8*, i16, i8, %struct.lock_class_key*, %struct.lock_class_key }
%struct.attribute_group = type { i8*, i16 (%struct.kobject*, %struct.attribute*, i32)*, i16 (%struct.kobject*, %struct.bin_attribute*, i32)*, %struct.attribute**, %struct.bin_attribute** }
%struct.bin_attribute = type { %struct.attribute, i64, i8*, i64 (%struct.file*, %struct.kobject*, %struct.bin_attribute*, i8*, i64, i64)*, i64 (%struct.file*, %struct.kobject*, %struct.bin_attribute*, i8*, i64, i64)*, i32 (%struct.file*, %struct.kobject*, %struct.bin_attribute*, %struct.vm_area_struct*)* }
%struct.kobj_ns_type_operations = type { i32, i1 ()*, i8* ()*, i8* (%struct.sock*)*, i8* ()*, void (i8*)* }
%struct.sock = type opaque
%struct.kernfs_node = type { %struct.atomic_t, %struct.atomic_t, %struct.lockdep_map, %struct.kernfs_node*, i8*, %struct.rb_node, i8*, i32, %union.anon.71, i8*, i64, i16, i16, %struct.kernfs_iattrs* }
%union.anon.71 = type { %struct.kernfs_elem_attr }
%struct.kernfs_elem_attr = type { %struct.kernfs_ops*, %struct.kernfs_open_node*, i64, %struct.kernfs_node* }
%struct.kernfs_ops = type { i32 (%struct.kernfs_open_file*)*, void (%struct.kernfs_open_file*)*, i32 (%struct.seq_file*, i8*)*, i8* (%struct.seq_file*, i64*)*, i8* (%struct.seq_file*, i8*, i64*)*, void (%struct.seq_file*, i8*)*, i64 (%struct.kernfs_open_file*, i8*, i64, i64)*, i64, i8, i64 (%struct.kernfs_open_file*, i8*, i64, i64)*, i32 (%struct.kernfs_open_file*, %struct.poll_table_struct*)*, i32 (%struct.kernfs_open_file*, %struct.vm_area_struct*)*, %struct.lock_class_key }
%struct.kernfs_open_file = type { %struct.kernfs_node*, %struct.file*, %struct.seq_file*, i8*, %struct.mutex, %struct.mutex, i32, %struct.list_head, i8*, i64, i8, %struct.vm_operations_struct* }
%struct.seq_file = type { i8*, i64, i64, i64, i64, i64, i64, %struct.mutex, %struct.seq_operations*, i32, %struct.file*, i8* }
%struct.seq_operations = type { i8* (%struct.seq_file*, i64*)*, void (%struct.seq_file*, i8*)*, i8* (%struct.seq_file*, i8*, i64*)*, i32 (%struct.seq_file*, i8*)* }
%struct.poll_table_struct = type opaque
%struct.kernfs_open_node = type opaque
%struct.kernfs_iattrs = type opaque
%struct.kref = type { %struct.refcount_struct }
%struct.delayed_work = type { %struct.work_struct, %struct.timer_list, %struct.workqueue_struct*, i32 }
%struct.timer_list = type { %struct.hlist_node, i64, void (%struct.timer_list*)*, i32, %struct.lockdep_map }
%struct.module_param_attrs = type opaque
%struct.module_attribute = type { %struct.attribute, i64 (%struct.module_attribute*, %struct.module_kobject*, i8*)*, i64 (%struct.module_attribute*, %struct.module_kobject*, i8*, i64)*, void (%struct.module*, i8*)*, i32 (%struct.module*)*, void (%struct.module*)* }
%struct.kernel_param = type { i8*, %struct.module*, %struct.kernel_param_ops*, i16, i8, i8, %union.anon.113 }
%struct.kernel_param_ops = type { i32, i32 (i8*, %struct.kernel_param*)*, i32 (i8*, %struct.kernel_param*)*, void (i8*)* }
%union.anon.113 = type { i8* }
%struct.kernel_symbol = type { i32, i32, i32 }
%struct.exception_table_entry = type { i32, i32, i32 }
%struct.module_layout = type { i8*, i32, i32, i32, i32, %struct.mod_tree_node }
%struct.mod_tree_node = type { %struct.module*, %struct.latch_tree_node }
%struct.latch_tree_node = type { [2 x %struct.rb_node] }
%struct.mod_arch_specific = type { i32, i32*, %struct.orc_entry* }
%struct.orc_entry = type { i16, i16, i16 }
%struct.bug_entry = type { i32, i32, i16, i16 }
%struct.mod_kallsyms = type { %struct.elf64_sym*, i32, i8*, i8* }
%struct.elf64_sym = type { i32, i8, i8, i16, i64, i64 }
%struct.module_sect_attrs = type opaque
%struct.module_notes_attrs = type opaque
%struct.srcu_struct = type { [521 x %struct.srcu_node], [4 x %struct.srcu_node*], %struct.mutex, %struct.spinlock, %struct.mutex, i32, i64, i64, i64, i64, %struct.srcu_data*, i64, %struct.mutex, %struct.completion, %struct.atomic_t, %struct.delayed_work, %struct.lockdep_map }
%struct.srcu_node = type { %struct.spinlock, [4 x i64], [4 x i64], i64, %struct.srcu_node*, i32, i32 }
%struct.srcu_data = type { [2 x i64], [2 x i64], [4064 x i8], %struct.spinlock, %struct.rcu_segcblist, i64, i64, i8, %struct.timer_list, %struct.work_struct, %struct.callback_head, %struct.srcu_node*, i64, i32, %struct.srcu_struct*, [3696 x i8] }
%struct.rcu_segcblist = type { %struct.callback_head*, [4 x %struct.callback_head**], [4 x i64], %struct.atomic64_t, i8, i8 }
%struct.completion = type { i32, %struct.swait_queue_head }
%struct.swait_queue_head = type { %struct.raw_spinlock, %struct.list_head }
%struct.bpf_raw_event_map = type { %struct.tracepoint*, i8*, i32, i32, [8 x i8] }
%struct.tracepoint = type { i8*, %struct.static_key, i32 ()*, void ()*, %struct.tracepoint_func* }
%struct.static_key = type { %struct.atomic_t, %union.anon.114 }
%union.anon.114 = type { i64 }
%struct.tracepoint_func = type { i8*, i8*, i32 }
%struct.jump_entry = type { i32, i32, i64 }
%struct.trace_event_call = type opaque
%struct.trace_eval_map = type opaque
%struct.klp_modinfo = type { %struct.elf64_hdr, %struct.elf64_shdr*, i8*, i32 }
%struct.elf64_hdr = type { [16 x i8], i16, i16, i32, i64, i64, i64, i32, i16, i16, i16, i16, i16, i16 }
%struct.elf64_shdr = type { i32, i32, i64, i64, i64, i64, i32, i32, i64, i64 }
%struct.error_injection_entry = type { i64, i32 }
%struct.super_operations = type { %struct.inode* (%struct.super_block*)*, void (%struct.inode*)*, void (%struct.inode*)*, void (%struct.inode*, i32)*, i32 (%struct.inode*, %struct.writeback_control*)*, i32 (%struct.inode*)*, void (%struct.inode*)*, void (%struct.super_block*)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*)*, i32 (%struct.super_block*)*, i32 (%struct.super_block*)*, i32 (%struct.super_block*)*, i32 (%struct.dentry*, %struct.kstatfs*)*, i32 (%struct.super_block*, i32*, i8*)*, void (%struct.super_block*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i64 (%struct.super_block*, i32, i8*, i64, i64)*, i64 (%struct.super_block*, i32, i8*, i64, i64)*, %struct.dquot** (%struct.inode*)*, i32 (%struct.super_block*, %struct.page*, i32)*, i64 (%struct.super_block*, %struct.shrink_control*)*, i64 (%struct.super_block*, %struct.shrink_control*)* }
%struct.writeback_control = type opaque
%struct.kstatfs = type opaque
%struct.dquot = type { %struct.hlist_node, %struct.list_head, %struct.list_head, %struct.list_head, %struct.mutex, %struct.spinlock, %struct.atomic_t, %struct.super_block*, %struct.kqid, i64, i64, %struct.mem_dqblk }
%struct.kqid = type { %union.anon.115, i32 }
%union.anon.115 = type { %struct.kuid_t }
%struct.mem_dqblk = type { i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.shrink_control = type { i32, i32, i64, i64, %struct.mem_cgroup* }
%struct.dquot_operations = type { i32 (%struct.dquot*)*, %struct.dquot* (%struct.super_block*, i32)*, void (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.super_block*, i32)*, i64* (%struct.inode*)*, i32 (%struct.inode*, %struct.kprojid_t*)*, i32 (%struct.inode*, i64*)*, i32 (%struct.super_block*, %struct.kqid*)* }
%struct.kprojid_t = type { i32 }
%struct.quotactl_ops = type { i32 (%struct.super_block*, i32, i32, %struct.path*)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32, %struct.qc_info*)*, i32 (%struct.super_block*, i64, %struct.qc_dqblk*)*, i32 (%struct.super_block*, %struct.kqid*, %struct.qc_dqblk*)*, i32 (%struct.super_block*, i64, %struct.qc_dqblk*)*, i32 (%struct.super_block*, %struct.qc_state*)*, i32 (%struct.super_block*, i32)* }
%struct.qc_info = type { i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.qc_dqblk = type { i32, i64, i64, i64, i64, i64, i64, i64, i64, i32, i32, i64, i64, i64, i64, i32 }
%struct.qc_state = type { i32, [3 x %struct.qc_type_state] }
%struct.qc_type_state = type { i32, i32, i32, i32, i32, i32, i32, i64, i64, i64 }
%struct.export_operations = type opaque
%struct.xattr_handler = type opaque
%struct.fscrypt_operations = type opaque
%struct.fsverity_operations = type opaque
%struct.hlist_bl_head = type { %struct.hlist_bl_node* }
%struct.block_device = type { i32, i32, %struct.inode*, %struct.super_block*, %struct.mutex, i8*, i8*, i32, i8, %struct.list_head, %struct.block_device*, i32, i8, %struct.hd_struct*, i32, i32, %struct.gendisk*, %struct.request_queue*, %struct.backing_dev_info*, %struct.list_head, i64, i32, %struct.mutex }
%struct.hd_struct = type opaque
%struct.gendisk = type opaque
%struct.mtd_info = type opaque
%struct.quota_info = type { i32, %struct.rw_semaphore, [3 x %struct.inode*], [3 x %struct.mem_dqinfo], [3 x %struct.quota_format_ops*] }
%struct.mem_dqinfo = type { %struct.quota_format_type*, i32, %struct.list_head, i64, i32, i32, i64, i64, i8* }
%struct.quota_format_type = type { i32, %struct.quota_format_ops*, %struct.module*, %struct.quota_format_type* }
%struct.quota_format_ops = type { i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.super_block*, %struct.kqid*)* }
%struct.sb_writers = type { i32, %struct.wait_queue_head, [3 x %struct.percpu_rw_semaphore] }
%struct.wait_queue_head = type { %struct.spinlock, %struct.list_head }
%struct.percpu_rw_semaphore = type { %struct.rcu_sync, i32*, %struct.rcuwait, %struct.wait_queue_head, %struct.atomic_t, %struct.lockdep_map }
%struct.rcu_sync = type { i32, i32, %struct.wait_queue_head, %struct.callback_head }
%struct.rcuwait = type { %struct.task_struct* }
%struct.uuid_t = type { [16 x i8] }
%struct.shrinker = type { i64 (%struct.shrinker*, %struct.shrink_control*)*, i64 (%struct.shrinker*, %struct.shrink_control*)*, i64, i32, i32, %struct.list_head, i32, %struct.atomic64_t* }
%struct.workqueue_struct = type opaque
%struct.list_lru = type { %struct.list_lru_node*, %struct.list_head, i32, i8 }
%struct.list_lru_node = type { %struct.spinlock, %struct.list_lru_one, %struct.list_lru_memcg*, i64, [16 x i8] }
%struct.list_lru_one = type { %struct.list_head, i64 }
%struct.list_lru_memcg = type { %struct.callback_head, [0 x %struct.list_lru_one*] }
%union.anon.116 = type { i32 }
%struct.timespec64 = type { i64, i64 }
%struct.bdi_writeback = type opaque
%union.anon.117 = type { %struct.callback_head }
%union.anon.118 = type { %struct.file_operations* }
%struct.file_operations = type { %struct.module*, i64 (%struct.file*, i64, i32)*, i64 (%struct.file*, i8*, i64, i64*)*, i64 (%struct.file*, i8*, i64, i64*)*, i64 (%struct.kiocb*, %struct.iov_iter*)*, i64 (%struct.kiocb*, %struct.iov_iter*)*, i32 (%struct.kiocb*, i1)*, i32 (%struct.file*, %struct.dir_context*)*, i32 (%struct.file*, %struct.dir_context*)*, i32 (%struct.file*, %struct.poll_table_struct*)*, i64 (%struct.file*, i32, i64)*, i64 (%struct.file*, i32, i64)*, i32 (%struct.file*, %struct.vm_area_struct*)*, i64, i32 (%struct.inode*, %struct.file*)*, i32 (%struct.file*, i8*)*, i32 (%struct.inode*, %struct.file*)*, i32 (%struct.file*, i64, i64, i32)*, i32 (i32, %struct.file*, i32)*, i32 (%struct.file*, i32, %struct.file_lock*)*, i64 (%struct.file*, %struct.page*, i32, i64, i64*, i32)*, i64 (%struct.file*, i64, i64, i64, i64)*, i32 (i32)*, i32 (%struct.file*, i32, %struct.file_lock*)*, i64 (%struct.pipe_inode_info*, %struct.file*, i64*, i64, i32)*, i64 (%struct.file*, i64*, %struct.pipe_inode_info*, i64, i32)*, i32 (%struct.file*, i64, %struct.file_lock**, i8**)*, i64 (%struct.file*, i32, i64, i64)*, void (%struct.seq_file*, %struct.file*)*, i64 (%struct.file*, i64, %struct.file*, i64, i64, i32)*, i64 (%struct.file*, i64, %struct.file*, i64, i64, i32)*, i32 (%struct.file*, i64, i64, i32)* }
%struct.kiocb = type { %struct.file*, i64, void (%struct.kiocb*, i64, i64)*, i8*, i32, i16, i16, i32 }
%struct.iov_iter = type { i32, i64, i64, %union.anon.74, %union.anon.75 }
%union.anon.74 = type { %struct.iovec* }
%struct.iovec = type { i8*, i64 }
%union.anon.75 = type { i64 }
%struct.dir_context = type { i32 (%struct.dir_context*, i8*, i32, i64, i64, i32)*, i64 }
%struct.file_lock = type { %struct.file_lock*, %struct.list_head, %struct.hlist_node, %struct.list_head, %struct.list_head, i8*, i32, i8, i32, i32, %struct.wait_queue_head, %struct.file*, i64, i64, %struct.fasync_struct*, i64, i64, %struct.file_lock_operations*, %struct.lock_manager_operations*, %union.anon.119 }
%struct.fasync_struct = type { %struct.rwlock_t, i32, i32, %struct.fasync_struct*, %struct.file*, %struct.callback_head }
%struct.rwlock_t = type { %struct.qrwlock, i32, i32, i8*, %struct.lockdep_map }
%struct.qrwlock = type { %union.anon.63, %struct.qspinlock }
%union.anon.63 = type { %struct.atomic_t }
%struct.file_lock_operations = type { void (%struct.file_lock*, %struct.file_lock*)*, void (%struct.file_lock*)* }
%struct.lock_manager_operations = type { i8* (i8*)*, void (i8*)*, void (%struct.file_lock*)*, i32 (%struct.file_lock*, i32)*, i1 (%struct.file_lock*)*, i32 (%struct.file_lock*, i32, %struct.list_head*)*, void (%struct.file_lock*, i8**)*, i1 (%struct.file_lock*)* }
%union.anon.119 = type { %struct.nfs_lock_info }
%struct.nfs_lock_info = type { i32, %struct.nlm_lockowner*, %struct.list_head }
%struct.nlm_lockowner = type opaque
%struct.file_lock_context = type { %struct.spinlock, %struct.list_head, %struct.list_head, %struct.list_head }
%union.anon.121 = type { %struct.pipe_inode_info* }
%struct.fsnotify_mark_connector = type opaque
%struct.fscrypt_info = type opaque
%struct.fsverity_info = type opaque
%struct.xarray = type { %struct.spinlock, i32, i8* }
%struct.address_space_operations = type { i32 (%struct.page*, %struct.writeback_control*)*, i32 (%struct.file*, %struct.page*)*, i32 (%struct.address_space*, %struct.writeback_control*)*, i32 (%struct.page*)*, i32 (%struct.file*, %struct.address_space*, %struct.list_head*, i32)*, void (%struct.readahead_control*)*, i32 (%struct.file*, %struct.address_space*, i64, i32, i32, %struct.page**, i8**)*, i32 (%struct.file*, %struct.address_space*, i64, i32, i32, %struct.page*, i8*)*, i64 (%struct.address_space*, i64)*, void (%struct.page*, i32, i32)*, i32 (%struct.page*, i32)*, void (%struct.page*)*, i64 (%struct.kiocb*, %struct.iov_iter*)*, i32 (%struct.address_space*, %struct.page*, %struct.page*, i32)*, i1 (%struct.page*, i32)*, void (%struct.page*)*, i32 (%struct.page*)*, i32 (%struct.page*, i64, i64)*, void (%struct.page*, i8*, i8*)*, i32 (%struct.address_space*, %struct.page*)*, i32 (%struct.swap_info_struct*, %struct.file*, i64*)*, void (%struct.file*)* }
%struct.readahead_control = type opaque
%struct.swap_info_struct = type opaque
%union.anon.88 = type { %struct.atomic_t }
%struct.vm_userfaultfd_ctx = type { %struct.userfaultfd_ctx* }
%struct.userfaultfd_ctx = type opaque
%struct.rb_root = type { %struct.rb_node* }
%struct.pgd_t = type { i64 }
%struct.rw_semaphore = type { %struct.atomic64_t, %struct.atomic64_t, %struct.optimistic_spin_queue, %struct.raw_spinlock, %struct.list_head, i8*, %struct.lockdep_map }
%struct.mm_rss_stat = type { [4 x %struct.atomic64_t] }
%struct.linux_binfmt = type opaque
%struct.mm_context_t = type { i64, %struct.atomic64_t, %struct.rw_semaphore, %struct.ldt_struct*, i16, %struct.mutex, i8*, %struct.vdso_image*, %struct.atomic_t, i16, i16 }
%struct.ldt_struct = type opaque
%struct.vdso_image = type { i8*, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.core_state = type { %struct.atomic_t, %struct.core_thread, %struct.completion }
%struct.core_thread = type { %struct.task_struct*, %struct.core_thread* }
%struct.kioctx_table = type opaque
%struct.user_namespace = type { %struct.uid_gid_map, %struct.uid_gid_map, %struct.uid_gid_map, %struct.atomic_t, %struct.user_namespace*, i32, %struct.kuid_t, %struct.kgid_t, %struct.ns_common, i64, %struct.list_head, %struct.key*, %struct.rw_semaphore, %struct.key*, %struct.work_struct, %struct.ctl_table_set, %struct.ctl_table_header*, %struct.ucounts*, [10 x i32] }
%struct.uid_gid_map = type { i32, %union.anon.44 }
%union.anon.44 = type { %struct.anon.45, [48 x i8] }
%struct.anon.45 = type { %struct.uid_gid_extent*, %struct.uid_gid_extent* }
%struct.uid_gid_extent = type { i32, i32, i32 }
%struct.ns_common = type { %struct.atomic64_t, %struct.proc_ns_operations*, i32 }
%struct.proc_ns_operations = type opaque
%struct.ctl_table_set = type { i32 (%struct.ctl_table_set*)*, %struct.ctl_dir }
%struct.ctl_dir = type { %struct.ctl_table_header, %struct.rb_root }
%struct.ctl_table_header = type { %union.anon.46, %struct.completion*, %struct.ctl_table*, %struct.ctl_table_root*, %struct.ctl_table_set*, %struct.ctl_dir*, %struct.ctl_node*, %struct.hlist_head }
%union.anon.46 = type { %struct.anon.47 }
%struct.anon.47 = type { %struct.ctl_table*, i32, i32, i32 }
%struct.ctl_table = type { i8*, i8*, i32, i16, %struct.ctl_table*, i32 (%struct.ctl_table*, i32, i8*, i64*, i64*)*, %struct.ctl_table_poll*, i8*, i8* }
%struct.ctl_table_poll = type { %struct.atomic_t, %struct.wait_queue_head }
%struct.ctl_table_root = type { %struct.ctl_table_set, %struct.ctl_table_set* (%struct.ctl_table_root*)*, void (%struct.ctl_table_header*, %struct.ctl_table*, %struct.kuid_t*, %struct.kgid_t*)*, i32 (%struct.ctl_table_header*, %struct.ctl_table*)* }
%struct.ctl_node = type { %struct.rb_node, %struct.ctl_table_header* }
%struct.ucounts = type { %struct.hlist_node, %struct.user_namespace*, %struct.kuid_t, i32, [10 x %struct.atomic_t] }
%struct.file = type { %union.anon.26, %struct.path, %struct.inode*, %struct.file_operations*, %struct.spinlock, i32, %struct.atomic64_t, i32, i32, %struct.mutex, i64, %struct.fown_struct, %struct.cred*, %struct.file_ra_state, i64, i8*, i8*, %struct.list_head, %struct.list_head, %struct.address_space*, i32, i32 }
%union.anon.26 = type { %struct.callback_head }
%struct.fown_struct = type { %struct.rwlock_t, %struct.pid*, i32, %struct.kuid_t, %struct.kuid_t, i32 }
%struct.file_ra_state = type { i64, i32, i32, i32, i32, i64 }
%struct.mmu_notifier_subscriptions = type opaque
%struct.uprobes_state = type { %struct.xol_area* }
%struct.xol_area = type opaque
%struct.work_struct = type { %struct.atomic64_t, %struct.list_head, void (%struct.work_struct*)*, %struct.lockdep_map }
%struct.vmacache = type { i64, [4 x %struct.vm_area_struct*] }
%struct.task_rss_stat = type { i32, [4 x i32] }
%struct.restart_block = type { i64 (%struct.restart_block*)*, %union.anon.31 }
%union.anon.31 = type { %struct.anon.32 }
%struct.anon.32 = type { i32*, i32, i32, i32, i64, i32* }
%struct.pid = type { %struct.refcount_struct, i32, %struct.spinlock, [4 x %struct.hlist_head], %struct.hlist_head, %struct.wait_queue_head, %struct.callback_head, [1 x %struct.upid] }
%struct.upid = type { i32, %struct.pid_namespace* }
%struct.pid_namespace = type opaque
%struct.prev_cputime = type { i64, i64, %struct.raw_spinlock }
%struct.posix_cputimers = type { [3 x %struct.posix_cputimer_base], i32, i32 }
%struct.posix_cputimer_base = type { i64, %struct.timerqueue_head }
%struct.cred = type { %struct.atomic_t, %struct.atomic_t, i8*, i32, %struct.kuid_t, %struct.kgid_t, %struct.kuid_t, %struct.kgid_t, %struct.kuid_t, %struct.kgid_t, %struct.kuid_t, %struct.kgid_t, i32, %struct.kernel_cap_struct, %struct.kernel_cap_struct, %struct.kernel_cap_struct, %struct.kernel_cap_struct, %struct.kernel_cap_struct, i8, %struct.key*, %struct.key*, %struct.key*, %struct.key*, i8*, %struct.user_struct*, %struct.user_namespace*, %struct.group_info*, %union.anon.48 }
%struct.kernel_cap_struct = type { [2 x i32] }
%struct.user_struct = type { %struct.refcount_struct, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic64_t, i64, i64, i64, %struct.atomic64_t, %struct.hlist_node, %struct.kuid_t, %struct.atomic64_t, %struct.ratelimit_state }
%struct.ratelimit_state = type { %struct.raw_spinlock, i32, i32, i32, i32, i64, i64 }
%struct.group_info = type { %struct.atomic_t, i32, [0 x %struct.kgid_t] }
%union.anon.48 = type { %struct.callback_head }
%struct.key = type { %struct.refcount_struct, i32, %union.anon.36, %struct.watch_list*, %struct.rw_semaphore, %struct.key_user*, i8*, %union.anon.37, i64, %struct.kuid_t, %struct.kgid_t, i32, i16, i16, i16, i64, %union.anon.38, %union.anon.42, %struct.key_restriction* }
%union.anon.36 = type { %struct.rb_node }
%struct.watch_list = type opaque
%struct.key_user = type opaque
%union.anon.37 = type { i64 }
%union.anon.38 = type { %struct.keyring_index_key }
%struct.keyring_index_key = type { i64, %union.anon.39, %struct.key_type*, %struct.key_tag*, i8* }
%union.anon.39 = type { i64 }
%struct.key_type = type opaque
%struct.key_tag = type { %struct.callback_head, %struct.refcount_struct, i8 }
%union.anon.42 = type { %union.key_payload }
%union.key_payload = type { [4 x i8*] }
%struct.key_restriction = type { i32 (%struct.key*, %struct.key_type*, %union.key_payload*, %struct.key*)*, %struct.key*, %struct.key_type* }
%struct.nameidata = type opaque
%struct.sysv_sem = type { %struct.sem_undo_list* }
%struct.sem_undo_list = type opaque
%struct.sysv_shm = type { %struct.list_head }
%struct.fs_struct = type opaque
%struct.files_struct = type opaque
%struct.nsproxy = type { %struct.atomic_t, %struct.uts_namespace*, %struct.ipc_namespace*, %struct.mnt_namespace*, %struct.pid_namespace*, %struct.net*, %struct.time_namespace*, %struct.time_namespace*, %struct.cgroup_namespace* }
%struct.uts_namespace = type opaque
%struct.ipc_namespace = type opaque
%struct.mnt_namespace = type opaque
%struct.net = type { %struct.refcount_struct, %struct.refcount_struct, %struct.spinlock, i32, i32, i32, %struct.spinlock, %struct.atomic_t, %struct.list_head, %struct.list_head, %struct.llist_node, %struct.key_tag*, %struct.user_namespace*, %struct.ucounts*, %struct.idr, %struct.ns_common, %struct.list_head, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.ctl_table_set, %struct.sock*, %struct.sock*, %struct.uevent_sock*, %struct.hlist_head*, %struct.hlist_head*, %struct.raw_notifier_head, i32, %struct.net_device*, %struct.list_head, %struct.netns_core, %struct.netns_mib, %struct.netns_packet, %struct.netns_unix, %struct.netns_nexthop, [8 x i8], %struct.netns_ipv4, %struct.netns_ipv6, %struct.netns_ieee802154_lowpan, %struct.netns_sctp, %struct.netns_dccp, %struct.netns_nf, %struct.netns_xt, %struct.netns_ct, %struct.netns_nftables, %struct.netns_nf_frag, %struct.ctl_table_header*, %struct.sock*, %struct.sock*, %struct.list_head, %struct.list_head, %struct.sk_buff_head, %struct.net_generic*, %struct.netns_bpf, [56 x i8], %struct.netns_xfrm, %struct.atomic64_t, %struct.netns_ipvs*, %struct.netns_mpls, %struct.netns_can, %struct.netns_xdp, %struct.sock*, %struct.sock* }
%struct.idr = type { %struct.xarray, i32, i32 }
%struct.proc_dir_entry = type opaque
%struct.uevent_sock = type opaque
%struct.raw_notifier_head = type { %struct.notifier_block* }
%struct.notifier_block = type { i32 (%struct.notifier_block*, i64, i8*)*, %struct.notifier_block*, i32 }
%struct.net_device = type { [16 x i8], %struct.netdev_name_node*, %struct.dev_ifalias*, i64, i64, i64, i32, i64, %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, %struct.anon.126, i64, i64, i64, i64, i64, i64, i64, i32, i32, %struct.net_device_stats, %struct.atomic64_t, %struct.atomic64_t, %struct.atomic64_t, %struct.atomic_t, %struct.atomic_t, %struct.iw_handler_def*, %struct.iw_public_data*, %struct.net_device_ops*, %struct.ethtool_ops*, %struct.l3mdev_ops*, %struct.ndisc_ops*, %struct.xfrmdev_ops*, %struct.tlsdev_ops*, %struct.header_ops*, i32, i32, i16, i16, i8, i8, i8, i8, i32, i32, i32, i16, i16, i8, i16, i16, [32 x i8], i8, i8, i8, i8, i16, i16, i16, %struct.spinlock, i8, i8, %struct.netdev_hw_addr_list, %struct.netdev_hw_addr_list, %struct.netdev_hw_addr_list, %struct.kset*, i32, i32, %struct.vlan_info*, %struct.dsa_port*, %struct.tipc_bearer*, i8*, %struct.in_device*, %struct.dn_dev*, %struct.inet6_dev*, i8*, %struct.wireless_dev*, %struct.wpan_dev*, %struct.mpls_dev*, i8*, %struct.netdev_rx_queue*, i32, i32, %struct.bpf_prog*, i64, i32, i32 (%struct.sk_buff**)*, i8*, %struct.mini_Qdisc*, %struct.netdev_queue*, %struct.nf_hook_entries*, [32 x i8], %struct.cpu_rmap*, %struct.hlist_node, [56 x i8], %struct.netdev_queue*, i32, i32, %struct.Qdisc*, i32, %struct.spinlock, %struct.xdp_dev_bulk_queue*, %struct.xps_dev_maps*, %struct.xps_dev_maps*, %struct.mini_Qdisc*, [16 x %struct.hlist_head], %struct.timer_list, i32, %struct.list_head, i32*, %struct.list_head, i8, i8, i16, i8, void (%struct.net_device*)*, %struct.netpoll_info*, %struct.possible_net_t, %union.anon.142, %struct.garp_port*, %struct.mrp_port*, %struct.device, [4 x %struct.attribute_group*], %struct.attribute_group*, %struct.rtnl_link_ops*, i32, i16, %struct.dcbnl_rtnl_ops*, i16, [16 x %struct.netdev_tc_txq], [16 x i8], i32, %struct.netprio_map*, %struct.phy_device*, %struct.sfp_bus*, %struct.lock_class_key*, %struct.lock_class_key*, i8, i8, %struct.list_head, %struct.macsec_ops* }
%struct.netdev_name_node = type { %struct.hlist_node, %struct.list_head, %struct.net_device*, i8* }
%struct.dev_ifalias = type { %struct.callback_head, [0 x i8] }
%struct.anon.126 = type { %struct.list_head, %struct.list_head }
%struct.net_device_stats = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.iw_handler_def = type opaque
%struct.iw_public_data = type opaque
%struct.net_device_ops = type { i32 (%struct.net_device*)*, void (%struct.net_device*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*)*, i32 (%struct.sk_buff*, %struct.net_device*)*, i64 (%struct.sk_buff*, %struct.net_device*, i64)*, i16 (%struct.net_device*, %struct.sk_buff*, %struct.net_device*)*, void (%struct.net_device*, i32)*, void (%struct.net_device*)*, i32 (%struct.net_device*, i8*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*, %struct.ifreq*, i32)*, i32 (%struct.net_device*, %struct.ifmap*)*, i32 (%struct.net_device*, i32)*, i32 (%struct.net_device*, %struct.neigh_parms*)*, void (%struct.net_device*, i32)*, void (%struct.net_device*, %struct.rtnl_link_stats64*)*, i1 (%struct.net_device*, i32)*, i32 (i32, %struct.net_device*, i8*)*, %struct.net_device_stats* (%struct.net_device*)*, i32 (%struct.net_device*, i16, i16)*, i32 (%struct.net_device*, i16, i16)*, void (%struct.net_device*)*, i32 (%struct.net_device*, %struct.netpoll_info*)*, void (%struct.net_device*)*, i32 (%struct.net_device*, i32, i8*)*, i32 (%struct.net_device*, i32, i16, i8, i16)*, i32 (%struct.net_device*, i32, i32, i32)*, i32 (%struct.net_device*, i32, i1)*, i32 (%struct.net_device*, i32, i1)*, i32 (%struct.net_device*, i32, %struct.ifla_vf_info*)*, i32 (%struct.net_device*, i32, i32)*, i32 (%struct.net_device*, i32, %struct.ifla_vf_stats*)*, i32 (%struct.net_device*, i32, %struct.nlattr**)*, i32 (%struct.net_device*, i32, %struct.sk_buff*)*, i32 (%struct.net_device*, i32, %struct.ifla_vf_guid*, %struct.ifla_vf_guid*)*, i32 (%struct.net_device*, i32, i64, i32)*, i32 (%struct.net_device*, i32, i1)*, i32 (%struct.net_device*, i32, i8*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*, i16, %struct.scatterlist*, i32)*, i32 (%struct.net_device*, i16)*, i32 (%struct.net_device*, i16, %struct.scatterlist*, i32)*, i32 (%struct.net_device*, %struct.netdev_fcoe_hbainfo*)*, i32 (%struct.net_device*, i64*, i32)*, i32 (%struct.net_device*, %struct.sk_buff*, i16, i32)*, i32 (%struct.net_device*, %struct.net_device*, %struct.netlink_ext_ack*)*, i32 (%struct.net_device*, %struct.net_device*)*, %struct.net_device* (%struct.net_device*, %struct.sk_buff*, i1)*, i64 (%struct.net_device*, i64)*, i32 (%struct.net_device*, i64)*, i32 (%struct.net_device*, %struct.neighbour*)*, void (%struct.net_device*, %struct.neighbour*)*, i32 (%struct.ndmsg*, %struct.nlattr**, %struct.net_device*, i8*, i16, i16, %struct.netlink_ext_ack*)*, i32 (%struct.ndmsg*, %struct.nlattr**, %struct.net_device*, i8*, i16)*, i32 (%struct.sk_buff*, %struct.netlink_callback*, %struct.net_device*, %struct.net_device*, i32*)*, i32 (%struct.sk_buff*, %struct.nlattr**, %struct.net_device*, i8*, i16, i32, i32, %struct.netlink_ext_ack*)*, i32 (%struct.net_device*, %struct.nlmsghdr*, i16, %struct.netlink_ext_ack*)*, i32 (%struct.sk_buff*, i32, i32, %struct.net_device*, i32, i32)*, i32 (%struct.net_device*, %struct.nlmsghdr*, i16)*, i32 (%struct.net_device*, i1)*, i32 (%struct.net_device*, %struct.netdev_phys_item_id*)*, i32 (%struct.net_device*, %struct.netdev_phys_item_id*)*, i32 (%struct.net_device*, i8*, i64)*, void (%struct.net_device*, %struct.udp_tunnel_info*)*, void (%struct.net_device*, %struct.udp_tunnel_info*)*, i8* (%struct.net_device*, %struct.net_device*)*, void (%struct.net_device*, i8*)*, i32 (%struct.net_device*, i32, i32)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*, i1)*, i32 (%struct.net_device*, %struct.sk_buff*)*, void (%struct.net_device*, i32)*, i32 (%struct.net_device*, %struct.netdev_bpf*)*, i32 (%struct.net_device*, i32, %struct.xdp_frame**, i32)*, i32 (%struct.net_device*, i32, i32)*, %struct.devlink_port* (%struct.net_device*)*, i32 (%struct.net_device*, %struct.ip_tunnel_parm*, i32)* }
%struct.sk_buff = type <{ %union.anon.51, %union.anon.54, %union.anon.55, [48 x i8], %union.anon.56, i64, i32, i32, i16, i16, i16, [0 x i8], i8, i8, [0 x i32], [0 x i8], i16, [0 x i8], i24, i16, %union.anon.58, i32, i32, i32, i16, i16, %union.anon.60, i32, %union.anon.61, %union.anon.62, i16, i16, i16, i16, i16, i16, i16, [0 x i32], i32, i32, i8*, i8*, i32, %struct.refcount_struct, %struct.skb_ext* }>
%union.anon.51 = type { %struct.anon.52 }
%struct.anon.52 = type { %struct.sk_buff*, %struct.sk_buff*, %union.anon.53 }
%union.anon.53 = type { %struct.net_device* }
%union.anon.54 = type { %struct.sock* }
%union.anon.55 = type { i64 }
%union.anon.56 = type { %struct.anon.57 }
%struct.anon.57 = type { i64, void (%struct.sk_buff*)* }
%union.anon.58 = type { i32 }
%union.anon.60 = type { i32 }
%union.anon.61 = type { i32 }
%union.anon.62 = type { i16 }
%struct.skb_ext = type { %struct.refcount_struct, [4 x i8], i8, [7 x i8], [0 x i8] }
%struct.ifreq = type { %union.anon.127, %union.anon.128 }
%union.anon.127 = type { [16 x i8] }
%union.anon.128 = type { %struct.ifmap }
%struct.ifmap = type { i64, i64, i16, i8, i8, i8 }
%struct.neigh_parms = type opaque
%struct.rtnl_link_stats64 = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.ifla_vf_info = type { i32, [32 x i8], i32, i32, i32, i32, i32, i32, i32, i32, i16 }
%struct.ifla_vf_stats = type { i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.nlattr = type { i16, i16 }
%struct.ifla_vf_guid = type { i32, i64 }
%struct.scatterlist = type { i64, i32, i32, i64, i32 }
%struct.netdev_fcoe_hbainfo = type { [64 x i8], [64 x i8], [64 x i8], [64 x i8], [64 x i8], [64 x i8], [256 x i8], [256 x i8] }
%struct.netlink_ext_ack = type { i8*, %struct.nlattr*, [20 x i8], i8 }
%struct.neighbour = type opaque
%struct.ndmsg = type { i8, i8, i16, i32, i16, i8, i8 }
%struct.netlink_callback = type { %struct.sk_buff*, %struct.nlmsghdr*, i32 (%struct.sk_buff*, %struct.netlink_callback*)*, i32 (%struct.netlink_callback*)*, i8*, %struct.module*, %struct.netlink_ext_ack*, i16, i16, i32, i32, i32, i8, %union.anon.130 }
%struct.nlmsghdr = type { i32, i16, i16, i32, i32 }
%union.anon.130 = type { [6 x i64] }
%struct.netdev_phys_item_id = type { [32 x i8], i8 }
%struct.udp_tunnel_info = type opaque
%struct.netdev_bpf = type { i32, %union.anon.131 }
%union.anon.131 = type { %struct.anon.132 }
%struct.anon.132 = type { i32, %struct.bpf_prog*, %struct.netlink_ext_ack* }
%struct.xdp_frame = type { i8*, i16, i16, i32, %struct.xdp_mem_info, %struct.net_device* }
%struct.xdp_mem_info = type { i32, i32 }
%struct.devlink_port = type opaque
%struct.ip_tunnel_parm = type opaque
%struct.ethtool_ops = type { i32, void (%struct.net_device*, %struct.ethtool_drvinfo*)*, i32 (%struct.net_device*)*, void (%struct.net_device*, %struct.ethtool_regs*, i8*)*, void (%struct.net_device*, %struct.ethtool_wolinfo*)*, i32 (%struct.net_device*, %struct.ethtool_wolinfo*)*, i32 (%struct.net_device*)*, void (%struct.net_device*, i32)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*, %struct.ethtool_eeprom*, i8*)*, i32 (%struct.net_device*, %struct.ethtool_eeprom*, i8*)*, i32 (%struct.net_device*, %struct.ethtool_coalesce*)*, i32 (%struct.net_device*, %struct.ethtool_coalesce*)*, void (%struct.net_device*, %struct.ethtool_ringparam*)*, i32 (%struct.net_device*, %struct.ethtool_ringparam*)*, void (%struct.net_device*, %struct.ethtool_pauseparam*)*, i32 (%struct.net_device*, %struct.ethtool_pauseparam*)*, void (%struct.net_device*, %struct.ethtool_test*, i64*)*, void (%struct.net_device*, i32, i8*)*, i32 (%struct.net_device*, i32)*, void (%struct.net_device*, %struct.ethtool_stats*, i64*)*, i32 (%struct.net_device*)*, void (%struct.net_device*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*, i32)*, i32 (%struct.net_device*, i32)*, i32 (%struct.net_device*, %struct.ethtool_rxnfc*, i32*)*, i32 (%struct.net_device*, %struct.ethtool_rxnfc*)*, i32 (%struct.net_device*, %struct.ethtool_flash*)*, i32 (%struct.net_device*, i32*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*, i32*, i8*, i8*)*, i32 (%struct.net_device*, i32*, i8*, i8)*, i32 (%struct.net_device*, i32*, i8*, i8*, i32)*, i32 (%struct.net_device*, i32*, i8*, i8, i32*, i1)*, void (%struct.net_device*, %struct.ethtool_channels*)*, i32 (%struct.net_device*, %struct.ethtool_channels*)*, i32 (%struct.net_device*, %struct.ethtool_dump*)*, i32 (%struct.net_device*, %struct.ethtool_dump*, i8*)*, i32 (%struct.net_device*, %struct.ethtool_dump*)*, i32 (%struct.net_device*, %struct.ethtool_ts_info*)*, i32 (%struct.net_device*, %struct.ethtool_modinfo*)*, i32 (%struct.net_device*, %struct.ethtool_eeprom*, i8*)*, i32 (%struct.net_device*, %struct.ethtool_eee*)*, i32 (%struct.net_device*, %struct.ethtool_eee*)*, i32 (%struct.net_device*, %struct.ethtool_tunable*, i8*)*, i32 (%struct.net_device*, %struct.ethtool_tunable*, i8*)*, i32 (%struct.net_device*, i32, %struct.ethtool_coalesce*)*, i32 (%struct.net_device*, i32, %struct.ethtool_coalesce*)*, i32 (%struct.net_device*, %struct.ethtool_link_ksettings*)*, i32 (%struct.net_device*, %struct.ethtool_link_ksettings*)*, i32 (%struct.net_device*, %struct.ethtool_fecparam*)*, i32 (%struct.net_device*, %struct.ethtool_fecparam*)*, void (%struct.net_device*, %struct.ethtool_stats*, i64*)* }
%struct.ethtool_drvinfo = type { i32, [32 x i8], [32 x i8], [32 x i8], [32 x i8], [32 x i8], [12 x i8], i32, i32, i32, i32, i32 }
%struct.ethtool_regs = type { i32, i32, i32, [0 x i8] }
%struct.ethtool_wolinfo = type { i32, i32, i32, [6 x i8] }
%struct.ethtool_coalesce = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.ethtool_ringparam = type { i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.ethtool_pauseparam = type { i32, i32, i32, i32 }
%struct.ethtool_test = type { i32, i32, i32, i32, [0 x i64] }
%struct.ethtool_rxnfc = type { i32, i32, i64, %struct.ethtool_rx_flow_spec, %union.anon.136, [0 x i32] }
%struct.ethtool_rx_flow_spec = type { i32, %union.ethtool_flow_union, %struct.ethtool_flow_ext, %union.ethtool_flow_union, %struct.ethtool_flow_ext, i64, i32 }
%union.ethtool_flow_union = type { %struct.ethtool_tcpip6_spec, [12 x i8] }
%struct.ethtool_tcpip6_spec = type { [4 x i32], [4 x i32], i16, i16, i8 }
%struct.ethtool_flow_ext = type { [2 x i8], [6 x i8], i16, i16, [2 x i32] }
%union.anon.136 = type { i32 }
%struct.ethtool_flash = type { i32, i32, [128 x i8] }
%struct.ethtool_channels = type { i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.ethtool_dump = type { i32, i32, i32, i32, [0 x i8] }
%struct.ethtool_ts_info = type { i32, i32, i32, i32, [3 x i32], i32, [3 x i32] }
%struct.ethtool_modinfo = type { i32, i32, i32, [8 x i32] }
%struct.ethtool_eeprom = type { i32, i32, i32, i32, [0 x i8] }
%struct.ethtool_eee = type { i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32] }
%struct.ethtool_tunable = type { i32, i32, i32, i32, [0 x i8*] }
%struct.ethtool_link_ksettings = type { %struct.ethtool_link_settings, %struct.anon.137 }
%struct.ethtool_link_settings = type { i32, i32, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, [1 x i8], [7 x i32], [0 x i32] }
%struct.anon.137 = type { [2 x i64], [2 x i64], [2 x i64] }
%struct.ethtool_fecparam = type { i32, i32, i32, i32 }
%struct.ethtool_stats = type { i32, i32, [0 x i64] }
%struct.l3mdev_ops = type opaque
%struct.ndisc_ops = type opaque
%struct.xfrmdev_ops = type { i32 (%struct.xfrm_state*)*, void (%struct.xfrm_state*)*, void (%struct.xfrm_state*)*, i1 (%struct.sk_buff*, %struct.xfrm_state*)*, void (%struct.xfrm_state*)* }
%struct.xfrm_state = type opaque
%struct.tlsdev_ops = type opaque
%struct.header_ops = type { i32 (%struct.sk_buff*, %struct.net_device*, i16, i8*, i8*, i32)*, i32 (%struct.sk_buff*, i8*)*, i32 (%struct.neighbour*, %struct.hh_cache*, i16)*, void (%struct.hh_cache*, %struct.net_device*, i8*)*, i1 (i8*, i32)*, i16 (%struct.sk_buff*)* }
%struct.hh_cache = type { i32, %struct.seqlock_t, [16 x i64] }
%struct.seqlock_t = type { %struct.seqcount, %struct.spinlock }
%struct.netdev_hw_addr_list = type { %struct.list_head, i32 }
%struct.vlan_info = type opaque
%struct.dsa_port = type opaque
%struct.tipc_bearer = type opaque
%struct.in_device = type opaque
%struct.dn_dev = type opaque
%struct.inet6_dev = type opaque
%struct.wireless_dev = type opaque
%struct.wpan_dev = type opaque
%struct.mpls_dev = type opaque
%struct.netdev_rx_queue = type { %struct.rps_map*, %struct.rps_dev_flow_table*, %struct.kobject, %struct.net_device*, [40 x i8], %struct.xdp_rxq_info, %struct.xdp_umem*, [56 x i8] }
%struct.rps_map = type { i32, %struct.callback_head, [0 x i16] }
%struct.rps_dev_flow_table = type { i32, %struct.callback_head, [0 x %struct.rps_dev_flow] }
%struct.rps_dev_flow = type { i16, i16, i32 }
%struct.xdp_rxq_info = type { %struct.net_device*, i32, i32, %struct.xdp_mem_info, [40 x i8] }
%struct.xdp_umem = type opaque
%struct.bpf_prog = type { i16, i16, i32, i32, i32, i32, [8 x i8], %struct.bpf_prog_aux*, %struct.sock_fprog_kern*, i32 (i8*, %struct.bpf_insn*)*, [0 x %struct.sock_filter], [0 x %struct.bpf_insn] }
%struct.bpf_prog_aux = type { %struct.atomic64_t, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.bpf_ctx_arg_aux*, %struct.bpf_prog*, i8, i8, i8, i8, i32, %struct.bpf_trampoline*, %struct.hlist_node, %struct.btf_type*, i8*, %struct.bpf_prog**, i8*, %struct.bpf_jit_poke_descriptor*, i32, %struct.bpf_ksym, %struct.bpf_prog_ops*, %struct.bpf_map**, %struct.bpf_prog*, %struct.user_struct*, i64, [2 x %struct.bpf_map*], [16 x i8], i8*, %struct.bpf_prog_offload*, %struct.btf*, %struct.bpf_func_info*, %struct.bpf_func_info_aux*, %struct.bpf_line_info*, i8**, i32, i32, i32, i32, %struct.exception_table_entry*, %struct.bpf_prog_stats*, %union.anon.145 }
%struct.bpf_ctx_arg_aux = type { i32, i32 }
%struct.bpf_trampoline = type { %struct.hlist_node, %struct.mutex, %struct.refcount_struct, i64, %struct.anon.4, %struct.bpf_prog*, [3 x %struct.hlist_head], [3 x i32], i8*, i64, %struct.bpf_ksym }
%struct.anon.4 = type { %struct.btf_func_model, i8*, i8 }
%struct.btf_func_model = type { i8, i8, [12 x i8] }
%struct.btf_type = type opaque
%struct.bpf_jit_poke_descriptor = type { i8*, %union.anon.5, i8, i8, i16 }
%union.anon.5 = type { %struct.anon.6 }
%struct.anon.6 = type { %struct.bpf_map*, i32 }
%struct.bpf_map = type { %struct.bpf_map_ops*, %struct.bpf_map*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.btf*, %struct.bpf_map_memory, [16 x i8], i32, i8, i8, [18 x i8], %struct.atomic64_t, %struct.atomic64_t, %struct.work_struct, %struct.mutex, i64, [56 x i8] }
%struct.bpf_map_ops = type { i32 (%union.bpf_attr*)*, %struct.bpf_map* (%union.bpf_attr*)*, void (%struct.bpf_map*, %struct.file*)*, void (%struct.bpf_map*)*, i32 (%struct.bpf_map*, i8*, i8*)*, void (%struct.bpf_map*)*, i8* (%struct.bpf_map*, i8*)*, i32 (%struct.bpf_map*, %union.bpf_attr*, %union.bpf_attr*)*, i32 (%struct.bpf_map*, %union.bpf_attr*, %union.bpf_attr*)*, i32 (%struct.bpf_map*, %union.bpf_attr*, %union.bpf_attr*)*, i32 (%struct.bpf_map*, %union.bpf_attr*, %union.bpf_attr*)*, i8* (%struct.bpf_map*, i8*)*, i32 (%struct.bpf_map*, i8*, i8*, i64)*, i32 (%struct.bpf_map*, i8*)*, i32 (%struct.bpf_map*, i8*, i64)*, i32 (%struct.bpf_map*, i8*)*, i32 (%struct.bpf_map*, i8*)*, i8* (%struct.bpf_map*, %struct.file*, i32)*, void (i8*)*, i32 (%struct.bpf_map*, %struct.bpf_insn*)*, i32 (i8*)*, void (%struct.bpf_map*, i8*, %struct.seq_file*)*, i32 (%struct.bpf_map*, %struct.btf*, %struct.btf_type*, %struct.btf_type*)*, i32 (%struct.bpf_map*, %struct.bpf_prog_aux*)*, void (%struct.bpf_map*, %struct.bpf_prog_aux*)*, void (%struct.bpf_map*, i32, %struct.bpf_prog*, %struct.bpf_prog*)*, i32 (%struct.bpf_map*, i64*, i32)*, i32 (%struct.bpf_map*, i64, i32*)*, i32 (%struct.bpf_map*, %struct.vm_area_struct*)*, i32 (%struct.bpf_map*, %struct.file*, %struct.poll_table_struct*)* }
%union.bpf_attr = type { %struct.anon.11 }
%struct.anon.11 = type { i32, i32, i64, i64, i32, i32, i64, i32, i32, [16 x i8], i32, i32, i32, i32, i64, i32, i32, i64, i32, i32, i32 }
%struct.bpf_insn = type { i8, i8, i16, i32 }
%struct.bpf_map_memory = type { i32, %struct.user_struct* }
%struct.bpf_ksym = type { i64, i64, [128 x i8], %struct.list_head, %struct.latch_tree_node, i8 }
%struct.bpf_prog_ops = type { i32 (%struct.bpf_prog*, %union.bpf_attr*, %union.bpf_attr*)* }
%struct.bpf_prog_offload = type { %struct.bpf_prog*, %struct.net_device*, %struct.bpf_offload_dev*, i8*, %struct.list_head, i8, i8, i8*, i32 }
%struct.bpf_offload_dev = type opaque
%struct.btf = type opaque
%struct.bpf_func_info = type { i32, i32 }
%struct.bpf_func_info_aux = type { i16, i8 }
%struct.bpf_line_info = type { i32, i32, i32, i32 }
%struct.bpf_prog_stats = type { i64, i64, %struct.u64_stats_sync }
%struct.u64_stats_sync = type {}
%union.anon.145 = type { %struct.work_struct }
%struct.sock_fprog_kern = type { i16, %struct.sock_filter* }
%struct.sock_filter = type { i16, i8, i8, i32 }
%struct.nf_hook_entries = type opaque
%struct.cpu_rmap = type opaque
%struct.netdev_queue = type { %struct.net_device*, %struct.Qdisc*, %struct.Qdisc*, %struct.kobject, i32, i64, i64, %struct.net_device*, %struct.xdp_umem*, %struct.spinlock, i32, i64, i64, [32 x i8], %struct.dql }
%struct.dql = type { i32, i32, i32, [52 x i8], i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, [20 x i8] }
%struct.Qdisc = type { i32 (%struct.sk_buff*, %struct.Qdisc*, %struct.sk_buff**)*, %struct.sk_buff* (%struct.Qdisc*)*, i32, i32, %struct.Qdisc_ops*, %struct.qdisc_size_table*, %struct.hlist_node, i32, i32, %struct.netdev_queue*, %struct.net_rate_estimator*, %struct.gnet_stats_basic_cpu*, %struct.gnet_stats_queue*, i32, %struct.refcount_struct, [24 x i8], %struct.sk_buff_head, %struct.qdisc_skb_head, %struct.gnet_stats_basic_packed, %struct.seqcount, %struct.gnet_stats_queue, i64, %struct.Qdisc*, %struct.sk_buff_head, [48 x i8], %struct.spinlock, %struct.spinlock, i8, %struct.callback_head, [24 x i8] }
%struct.Qdisc_ops = type { %struct.Qdisc_ops*, %struct.Qdisc_class_ops*, [16 x i8], i32, i32, i32 (%struct.sk_buff*, %struct.Qdisc*, %struct.sk_buff**)*, %struct.sk_buff* (%struct.Qdisc*)*, %struct.sk_buff* (%struct.Qdisc*)*, i32 (%struct.Qdisc*, %struct.nlattr*, %struct.netlink_ext_ack*)*, void (%struct.Qdisc*)*, void (%struct.Qdisc*)*, i32 (%struct.Qdisc*, %struct.nlattr*, %struct.netlink_ext_ack*)*, void (%struct.Qdisc*)*, i32 (%struct.Qdisc*, i32)*, i32 (%struct.Qdisc*, %struct.sk_buff*)*, i32 (%struct.Qdisc*, %struct.gnet_dump*)*, void (%struct.Qdisc*, i32)*, void (%struct.Qdisc*, i32)*, i32 (%struct.Qdisc*)*, i32 (%struct.Qdisc*)*, %struct.module* }
%struct.Qdisc_class_ops = type { i32, %struct.netdev_queue* (%struct.Qdisc*, %struct.tcmsg*)*, i32 (%struct.Qdisc*, i64, %struct.Qdisc*, %struct.Qdisc**, %struct.netlink_ext_ack*)*, %struct.Qdisc* (%struct.Qdisc*, i64)*, void (%struct.Qdisc*, i64)*, i64 (%struct.Qdisc*, i32)*, i32 (%struct.Qdisc*, i32, i32, %struct.nlattr**, i64*, %struct.netlink_ext_ack*)*, i32 (%struct.Qdisc*, i64)*, void (%struct.Qdisc*, %struct.qdisc_walker*)*, %struct.tcf_block* (%struct.Qdisc*, i64, %struct.netlink_ext_ack*)*, i64 (%struct.Qdisc*, i64, i32)*, void (%struct.Qdisc*, i64)*, i32 (%struct.Qdisc*, i64, %struct.sk_buff*, %struct.tcmsg*)*, i32 (%struct.Qdisc*, i64, %struct.gnet_dump*)* }
%struct.tcmsg = type { i8, i8, i16, i32, i32, i32, i32 }
%struct.qdisc_walker = type opaque
%struct.tcf_block = type { %struct.mutex, %struct.list_head, i32, i32, %struct.refcount_struct, %struct.net*, %struct.Qdisc*, %struct.rw_semaphore, %struct.flow_block, %struct.list_head, i8, %struct.atomic_t, i32, i32, %struct.anon.141, %struct.callback_head, [128 x %struct.hlist_head], %struct.mutex }
%struct.flow_block = type { %struct.list_head }
%struct.anon.141 = type { %struct.tcf_chain*, %struct.list_head }
%struct.tcf_chain = type { %struct.mutex, %struct.tcf_proto*, %struct.list_head, %struct.tcf_block*, i32, i32, i32, i8, i8, %struct.tcf_proto_ops*, i8*, %struct.callback_head }
%struct.tcf_proto = type { %struct.tcf_proto*, i8*, i32 (%struct.sk_buff*, %struct.tcf_proto*, %struct.tcf_result*)*, i16, i32, i8*, %struct.tcf_proto_ops*, %struct.tcf_chain*, %struct.spinlock, i8, %struct.refcount_struct, %struct.callback_head, %struct.hlist_node }
%struct.tcf_result = type { %union.anon.138 }
%union.anon.138 = type { %struct.anon.139 }
%struct.anon.139 = type { i64, i32 }
%struct.tcf_proto_ops = type { %struct.list_head, [16 x i8], i32 (%struct.sk_buff*, %struct.tcf_proto*, %struct.tcf_result*)*, i32 (%struct.tcf_proto*)*, void (%struct.tcf_proto*, i1, %struct.netlink_ext_ack*)*, i8* (%struct.tcf_proto*, i32)*, void (%struct.tcf_proto*, i8*)*, i32 (%struct.net*, %struct.sk_buff*, %struct.tcf_proto*, i64, i32, %struct.nlattr**, i8**, i1, i1, %struct.netlink_ext_ack*)*, i32 (%struct.tcf_proto*, i8*, i8*, i1, %struct.netlink_ext_ack*)*, i1 (%struct.tcf_proto*)*, void (%struct.tcf_proto*, %struct.tcf_walker*, i1)*, i32 (%struct.tcf_proto*, i1, i32 (i32, i8*, i8*)*, i8*, %struct.netlink_ext_ack*)*, void (%struct.tcf_proto*, i8*)*, void (%struct.tcf_proto*, i8*)*, void (i8*, i32, i64, i8*, i64)*, i8* (%struct.net*, %struct.tcf_chain*, %struct.nlattr**, %struct.netlink_ext_ack*)*, void (i8*)*, i32 (%struct.net*, %struct.tcf_proto*, i8*, %struct.sk_buff*, %struct.tcmsg*, i1)*, i32 (%struct.net*, %struct.tcf_proto*, i8*, %struct.sk_buff*, %struct.tcmsg*, i1)*, i32 (%struct.sk_buff*, %struct.net*, i8*)*, %struct.module*, i32 }
%struct.tcf_walker = type opaque
%struct.gnet_dump = type { %struct.spinlock*, %struct.sk_buff*, %struct.nlattr*, i32, i32, i32, i8*, i32, %struct.tc_stats }
%struct.tc_stats = type { i64, i32, i32, i32, i32, i32, i32, i32 }
%struct.qdisc_size_table = type { %struct.callback_head, %struct.list_head, %struct.tc_sizespec, i32, [0 x i16] }
%struct.tc_sizespec = type { i8, i8, i16, i32, i32, i32, i32, i32 }
%struct.net_rate_estimator = type opaque
%struct.gnet_stats_basic_cpu = type { %struct.gnet_stats_basic_packed, %struct.u64_stats_sync }
%struct.qdisc_skb_head = type { %struct.sk_buff*, %struct.sk_buff*, i32, %struct.spinlock }
%struct.gnet_stats_basic_packed = type { i64, i64 }
%struct.gnet_stats_queue = type { i32, i32, i32, i32, i32 }
%struct.xdp_dev_bulk_queue = type opaque
%struct.xps_dev_maps = type { %struct.callback_head, [0 x %struct.xps_map*] }
%struct.xps_map = type { i32, i32, %struct.callback_head, [0 x i16] }
%struct.mini_Qdisc = type { %struct.tcf_proto*, %struct.tcf_block*, %struct.gnet_stats_basic_cpu*, %struct.gnet_stats_queue*, %struct.callback_head }
%struct.netpoll_info = type opaque
%struct.possible_net_t = type { %struct.net* }
%union.anon.142 = type { i8* }
%struct.garp_port = type opaque
%struct.mrp_port = type opaque
%struct.device = type { %struct.kobject, %struct.device*, %struct.device_private*, i8*, %struct.device_type*, %struct.bus_type*, %struct.device_driver*, i8*, i8*, %struct.mutex, %struct.mutex, %struct.dev_links_info, %struct.dev_pm_info, %struct.dev_pm_domain*, %struct.irq_domain*, %struct.dev_pin_info*, %struct.list_head, %struct.dma_map_ops*, i64*, i64, i64, i64, %struct.device_dma_parameters*, %struct.list_head, %struct.dma_coherent_mem*, %struct.cma*, %struct.dev_archdata, %struct.device_node*, %struct.fwnode_handle*, i32, i32, i32, %struct.spinlock, %struct.list_head, %struct.class*, %struct.attribute_group**, void (%struct.device*)*, %struct.iommu_group*, %struct.dev_iommu*, i8 }
%struct.device_private = type opaque
%struct.device_type = type { i8*, %struct.attribute_group**, i32 (%struct.device*, %struct.kobj_uevent_env*)*, i8* (%struct.device*, i16*, %struct.kuid_t*, %struct.kgid_t*)*, void (%struct.device*)*, %struct.dev_pm_ops* }
%struct.dev_pm_ops = type { i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)* }
%struct.bus_type = type { i8*, i8*, %struct.device*, %struct.attribute_group**, %struct.attribute_group**, %struct.attribute_group**, i32 (%struct.device*, %struct.device_driver*)*, i32 (%struct.device*, %struct.kobj_uevent_env*)*, i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*, i32)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, %struct.dev_pm_ops*, %struct.iommu_ops*, %struct.subsys_private*, %struct.lock_class_key, i8 }
%struct.iommu_ops = type opaque
%struct.subsys_private = type opaque
%struct.device_driver = type { i8*, %struct.bus_type*, %struct.module*, i8*, i8, i32, %struct.of_device_id*, %struct.acpi_device_id*, i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*, i32)*, i32 (%struct.device*)*, %struct.attribute_group**, %struct.attribute_group**, %struct.dev_pm_ops*, void (%struct.device*)*, %struct.driver_private* }
%struct.of_device_id = type opaque
%struct.acpi_device_id = type opaque
%struct.driver_private = type opaque
%struct.dev_links_info = type { %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, i8, i32 }
%struct.dev_pm_info = type { %struct.pm_message, i16, i32, %struct.spinlock, %struct.list_head, %struct.completion, %struct.wakeup_source*, i8, %struct.hrtimer, i64, %struct.work_struct, %struct.wait_queue_head, %struct.wake_irq*, %struct.atomic_t, %struct.atomic_t, i16, i32, i32, i32, i32, i32, i64, i64, i64, i64, %struct.pm_subsys_data*, void (%struct.device*, i32)*, %struct.dev_pm_qos* }
%struct.pm_message = type { i32 }
%struct.wakeup_source = type { i8*, i32, %struct.list_head, %struct.spinlock, %struct.wake_irq*, %struct.timer_list, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, %struct.device*, i8 }
%struct.wake_irq = type opaque
%struct.pm_subsys_data = type { %struct.spinlock, i32, %struct.list_head, %struct.pm_domain_data* }
%struct.pm_domain_data = type opaque
%struct.dev_pm_qos = type opaque
%struct.dev_pm_domain = type { %struct.dev_pm_ops, i32 (%struct.device*)*, void (%struct.device*, i1)*, i32 (%struct.device*)*, void (%struct.device*)*, void (%struct.device*)* }
%struct.irq_domain = type opaque
%struct.dev_pin_info = type opaque
%struct.dma_map_ops = type { i8* (%struct.device*, i64, i64*, i32, i64)*, void (%struct.device*, i64, i8*, i64, i64)*, i32 (%struct.device*, %struct.vm_area_struct*, i8*, i64, i64, i64)*, i32 (%struct.device*, %struct.sg_table*, i8*, i64, i64, i64)*, i64 (%struct.device*, %struct.page*, i64, i64, i32, i64)*, void (%struct.device*, i64, i64, i32, i64)*, i32 (%struct.device*, %struct.scatterlist*, i32, i32, i64)*, void (%struct.device*, %struct.scatterlist*, i32, i32, i64)*, i64 (%struct.device*, i64, i64, i32, i64)*, void (%struct.device*, i64, i64, i32, i64)*, void (%struct.device*, i64, i64, i32)*, void (%struct.device*, i64, i64, i32)*, void (%struct.device*, %struct.scatterlist*, i32, i32)*, void (%struct.device*, %struct.scatterlist*, i32, i32)*, void (%struct.device*, i8*, i64, i32)*, i32 (%struct.device*, i64)*, i64 (%struct.device*)*, i64 (%struct.device*)*, i64 (%struct.device*)* }
%struct.sg_table = type { %struct.scatterlist*, i32, i32 }
%struct.device_dma_parameters = type { i32, i64 }
%struct.dma_coherent_mem = type opaque
%struct.cma = type opaque
%struct.dev_archdata = type { i8* }
%struct.device_node = type opaque
%struct.fwnode_handle = type { %struct.fwnode_handle*, %struct.fwnode_operations*, %struct.device* }
%struct.fwnode_operations = type { %struct.fwnode_handle* (%struct.fwnode_handle*)*, void (%struct.fwnode_handle*)*, i1 (%struct.fwnode_handle*)*, i8* (%struct.fwnode_handle*, %struct.device*)*, i1 (%struct.fwnode_handle*, i8*)*, i32 (%struct.fwnode_handle*, i8*, i32, i8*, i64)*, i32 (%struct.fwnode_handle*, i8*, i8**, i64)*, i8* (%struct.fwnode_handle*)*, i8* (%struct.fwnode_handle*)*, %struct.fwnode_handle* (%struct.fwnode_handle*)*, %struct.fwnode_handle* (%struct.fwnode_handle*, %struct.fwnode_handle*)*, %struct.fwnode_handle* (%struct.fwnode_handle*, i8*)*, i32 (%struct.fwnode_handle*, i8*, i8*, i32, i32, %struct.fwnode_reference_args*)*, %struct.fwnode_handle* (%struct.fwnode_handle*, %struct.fwnode_handle*)*, %struct.fwnode_handle* (%struct.fwnode_handle*)*, %struct.fwnode_handle* (%struct.fwnode_handle*)*, i32 (%struct.fwnode_handle*, %struct.fwnode_endpoint*)*, i32 (%struct.fwnode_handle*, %struct.device*)* }
%struct.fwnode_reference_args = type { %struct.fwnode_handle*, i32, [8 x i64] }
%struct.fwnode_endpoint = type { i32, i32, %struct.fwnode_handle* }
%struct.class = type { i8*, %struct.module*, %struct.attribute_group**, %struct.attribute_group**, %struct.kobject*, i32 (%struct.device*, %struct.kobj_uevent_env*)*, i8* (%struct.device*, i16*)*, void (%struct.class*)*, void (%struct.device*)*, i32 (%struct.device*)*, %struct.kobj_ns_type_operations*, i8* (%struct.device*)*, void (%struct.device*, %struct.kuid_t*, %struct.kgid_t*)*, %struct.dev_pm_ops*, %struct.subsys_private* }
%struct.iommu_group = type opaque
%struct.dev_iommu = type opaque
%struct.rtnl_link_ops = type { %struct.list_head, i8*, i64, void (%struct.net_device*)*, i32, %struct.nla_policy*, i32 (%struct.nlattr**, %struct.nlattr**, %struct.netlink_ext_ack*)*, i32 (%struct.net*, %struct.net_device*, %struct.nlattr**, %struct.nlattr**, %struct.netlink_ext_ack*)*, i32 (%struct.net_device*, %struct.nlattr**, %struct.nlattr**, %struct.netlink_ext_ack*)*, void (%struct.net_device*, %struct.list_head*)*, i64 (%struct.net_device*)*, i32 (%struct.sk_buff*, %struct.net_device*)*, i64 (%struct.net_device*)*, i32 (%struct.sk_buff*, %struct.net_device*)*, i32 ()*, i32 ()*, i32, %struct.nla_policy*, i32 (%struct.net_device*, %struct.net_device*, %struct.nlattr**, %struct.nlattr**, %struct.netlink_ext_ack*)*, i64 (%struct.net_device*, %struct.net_device*)*, i32 (%struct.sk_buff*, %struct.net_device*, %struct.net_device*)*, %struct.net* (%struct.net_device*)*, i64 (%struct.net_device*, i32)*, i32 (%struct.sk_buff*, %struct.net_device*, i32*, i32)* }
%struct.nla_policy = type { i8, i8, i16, %union.anon.143 }
%union.anon.143 = type { i8* }
%struct.dcbnl_rtnl_ops = type { i32 (%struct.net_device*, %struct.ieee_ets*)*, i32 (%struct.net_device*, %struct.ieee_ets*)*, i32 (%struct.net_device*, %struct.ieee_maxrate*)*, i32 (%struct.net_device*, %struct.ieee_maxrate*)*, i32 (%struct.net_device*, %struct.ieee_qcn*)*, i32 (%struct.net_device*, %struct.ieee_qcn*)*, i32 (%struct.net_device*, %struct.ieee_qcn_stats*)*, i32 (%struct.net_device*, %struct.ieee_pfc*)*, i32 (%struct.net_device*, %struct.ieee_pfc*)*, i32 (%struct.net_device*, %struct.dcb_app*)*, i32 (%struct.net_device*, %struct.dcb_app*)*, i32 (%struct.net_device*, %struct.dcb_app*)*, i32 (%struct.net_device*, %struct.ieee_ets*)*, i32 (%struct.net_device*, %struct.ieee_pfc*)*, i8 (%struct.net_device*)*, i8 (%struct.net_device*, i8)*, void (%struct.net_device*, i8*)*, void (%struct.net_device*, i32, i8, i8, i8, i8)*, void (%struct.net_device*, i32, i8)*, void (%struct.net_device*, i32, i8, i8, i8, i8)*, void (%struct.net_device*, i32, i8)*, void (%struct.net_device*, i32, i8*, i8*, i8*, i8*)*, void (%struct.net_device*, i32, i8*)*, void (%struct.net_device*, i32, i8*, i8*, i8*, i8*)*, void (%struct.net_device*, i32, i8*)*, void (%struct.net_device*, i32, i8)*, void (%struct.net_device*, i32, i8*)*, i8 (%struct.net_device*)*, i8 (%struct.net_device*, i32, i8*)*, i32 (%struct.net_device*, i32, i8*)*, i32 (%struct.net_device*, i32, i8)*, i8 (%struct.net_device*)*, void (%struct.net_device*, i8)*, void (%struct.net_device*, i32, i32*)*, void (%struct.net_device*, i32, i32)*, void (%struct.net_device*, i32, i8*)*, void (%struct.net_device*, i32, i8)*, i32 (%struct.net_device*, i8, i16, i8)*, i32 (%struct.net_device*, i8, i16)*, i8 (%struct.net_device*, i32, i8*)*, i8 (%struct.net_device*, i32, i8)*, i8 (%struct.net_device*)*, i8 (%struct.net_device*, i8)*, i32 (%struct.net_device*, %struct.dcb_peer_app_info*, i16*)*, i32 (%struct.net_device*, %struct.dcb_app*)*, i32 (%struct.net_device*, %struct.cee_pg*)*, i32 (%struct.net_device*, %struct.cee_pfc*)*, i32 (%struct.net_device*, %struct.dcbnl_buffer*)*, i32 (%struct.net_device*, %struct.dcbnl_buffer*)* }
%struct.ieee_maxrate = type { [8 x i64] }
%struct.ieee_qcn = type { [8 x i8], [8 x i32], [8 x i32], [8 x i32], [8 x i32], [8 x i32], [8 x i32], [8 x i32], [8 x i32], [8 x i32], [8 x i32], [8 x i32] }
%struct.ieee_qcn_stats = type { [8 x i64], [8 x i32] }
%struct.ieee_ets = type { i8, i8, i8, [8 x i8], [8 x i8], [8 x i8], [8 x i8], [8 x i8], [8 x i8], [8 x i8] }
%struct.ieee_pfc = type { i8, i8, i8, i16, [8 x i64], [8 x i64] }
%struct.dcb_peer_app_info = type { i8, i8 }
%struct.dcb_app = type { i8, i8, i16 }
%struct.cee_pg = type { i8, i8, i8, i8, [8 x i8], [8 x i8] }
%struct.cee_pfc = type { i8, i8, i8, i8 }
%struct.dcbnl_buffer = type { [8 x i8], [8 x i32], i32 }
%struct.netdev_tc_txq = type { i16, i16 }
%struct.netprio_map = type { %struct.callback_head, i32, [0 x i32] }
%struct.phy_device = type opaque
%struct.sfp_bus = type opaque
%struct.macsec_ops = type opaque
%struct.netns_core = type { %struct.ctl_table_header*, i32, i32*, %struct.prot_inuse* }
%struct.prot_inuse = type opaque
%struct.netns_mib = type { %struct.tcp_mib*, %struct.ipstats_mib*, %struct.linux_mib*, %struct.udp_mib*, %struct.udp_mib*, %struct.icmp_mib*, %struct.icmpmsg_mib*, %struct.proc_dir_entry*, %struct.udp_mib*, %struct.udp_mib*, %struct.ipstats_mib*, %struct.icmpv6_mib*, %struct.icmpv6msg_mib*, %struct.linux_xfrm_mib*, %struct.linux_tls_mib*, %struct.mptcp_mib* }
%struct.tcp_mib = type { [16 x i64] }
%struct.linux_mib = type { [122 x i64] }
%struct.icmp_mib = type { [28 x i64] }
%struct.icmpmsg_mib = type { [512 x %struct.atomic64_t] }
%struct.udp_mib = type { [9 x i64] }
%struct.ipstats_mib = type { [37 x i64], %struct.u64_stats_sync }
%struct.icmpv6_mib = type { [6 x i64] }
%struct.icmpv6msg_mib = type { [512 x %struct.atomic64_t] }
%struct.linux_xfrm_mib = type { [29 x i64] }
%struct.linux_tls_mib = type { [11 x i64] }
%struct.mptcp_mib = type opaque
%struct.netns_packet = type { %struct.mutex, %struct.hlist_head }
%struct.netns_unix = type { i32, %struct.ctl_table_header* }
%struct.netns_nexthop = type { %struct.rb_root, %struct.hlist_head*, i32, i32, %struct.atomic_notifier_head }
%struct.atomic_notifier_head = type { %struct.spinlock, %struct.notifier_block* }
%struct.netns_ipv4 = type { %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ipv4_devconf*, %struct.ipv4_devconf*, %struct.ip_ra_chain*, %struct.mutex, %struct.fib_rules_ops*, i8, i32, %struct.fib_table*, %struct.fib_table*, i8, i32, %struct.hlist_head*, i8, %struct.sock*, %struct.sock**, %struct.sock*, %struct.inet_peer_base*, %struct.sock**, %struct.fqdir*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, i32, i32, i32, i32, i32, i32, %struct.local_ports, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [3 x i32], [3 x i32], i32, i64, i64, [40 x i8], %struct.inet_timewait_death_row, i32, i32, %struct.tcp_congestion_ops*, %struct.tcp_fastopen_context*, %struct.spinlock, i32, %struct.atomic_t, i64, i32, i32, i32, i32, i32, i32, i32, %struct.ping_group_range, %struct.atomic_t, i64*, i32, %struct.list_head, %struct.fib_rules_ops*, i32, i32, %struct.fib_notifier_ops*, i32, %struct.fib_notifier_ops*, i32, %struct.atomic_t, %struct.siphash_key_t }
%struct.ipv4_devconf = type opaque
%struct.ip_ra_chain = type opaque
%struct.fib_table = type opaque
%struct.inet_peer_base = type opaque
%struct.fqdir = type { i64, i64, i32, i32, %struct.inet_frags*, %struct.net*, i8, [23 x i8], %struct.rhashtable, %struct.atomic64_t, %struct.work_struct, [40 x i8] }
%struct.inet_frags = type { i32, void (%struct.inet_frag_queue*, i8*)*, void (%struct.inet_frag_queue*)*, void (%struct.timer_list*)*, %struct.kmem_cache*, i8*, %struct.rhashtable_params, %struct.refcount_struct, %struct.completion }
%struct.inet_frag_queue = type { %struct.rhash_head, %union.anon.49, %struct.timer_list, %struct.spinlock, %struct.refcount_struct, %struct.rb_root, %struct.sk_buff*, %struct.sk_buff*, i64, i32, i32, i8, i16, %struct.fqdir*, %struct.callback_head }
%struct.rhash_head = type { %struct.rhash_head* }
%union.anon.49 = type { %struct.frag_v6_compare_key }
%struct.frag_v6_compare_key = type { %struct.in6_addr, %struct.in6_addr, i32, i32, i32 }
%struct.in6_addr = type { %union.anon.50 }
%union.anon.50 = type { [4 x i32] }
%struct.rhashtable_params = type { i16, i16, i16, i16, i32, i16, i8, i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)*, i32 (%struct.rhashtable_compare_arg*, i8*)* }
%struct.rhashtable_compare_arg = type { %struct.rhashtable*, i8* }
%struct.rhashtable = type { %struct.bucket_table*, i32, i32, %struct.rhashtable_params, i8, %struct.work_struct, %struct.mutex, %struct.spinlock, %struct.atomic_t }
%struct.bucket_table = type { i32, i32, i32, %struct.list_head, %struct.callback_head, %struct.bucket_table*, %struct.lockdep_map, [24 x i8], [0 x %struct.rhash_lock_head*] }
%struct.rhash_lock_head = type {}
%struct.xt_table = type opaque
%struct.local_ports = type { %struct.seqlock_t, [2 x i32], i8 }
%struct.inet_timewait_death_row = type { %struct.atomic_t, [60 x i8], %struct.inet_hashinfo*, i32, [52 x i8] }
%struct.inet_hashinfo = type opaque
%struct.tcp_congestion_ops = type opaque
%struct.tcp_fastopen_context = type opaque
%struct.ping_group_range = type { %struct.seqlock_t, [2 x %struct.kgid_t] }
%struct.fib_rules_ops = type opaque
%struct.fib_notifier_ops = type opaque
%struct.siphash_key_t = type { [2 x i64] }
%struct.netns_ipv6 = type { %struct.netns_sysctl_ipv6, %struct.ipv6_devconf*, %struct.ipv6_devconf*, %struct.inet_peer_base*, %struct.fqdir*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, %struct.fib6_info*, %struct.rt6_info*, %struct.rt6_statistics*, %struct.timer_list, %struct.hlist_head*, %struct.fib6_table*, %struct.list_head, [32 x i8], %struct.dst_ops, %struct.rwlock_t, %struct.spinlock, i32, i64, i32, i8, i32, %struct.rt6_info*, %struct.rt6_info*, %struct.fib6_table*, %struct.fib_rules_ops*, %struct.sock**, %struct.sock*, %struct.sock*, %struct.sock*, %struct.sock*, %struct.list_head, %struct.fib_rules_ops*, %struct.atomic_t, %struct.atomic_t, %struct.seg6_pernet_data*, %struct.fib_notifier_ops*, %struct.fib_notifier_ops*, i32, %struct.anon.65, [48 x i8] }
%struct.netns_sysctl_ipv6 = type { %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [4 x i64], i64*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8 }
%struct.ipv6_devconf = type opaque
%struct.fib6_info = type opaque
%struct.rt6_statistics = type opaque
%struct.dst_ops = type { i16, i32, i32 (%struct.dst_ops*)*, %struct.dst_entry* (%struct.dst_entry*, i32)*, i32 (%struct.dst_entry*)*, i32 (%struct.dst_entry*)*, i32* (%struct.dst_entry*, i64)*, void (%struct.dst_entry*)*, void (%struct.dst_entry*, %struct.net_device*, i32)*, %struct.dst_entry* (%struct.dst_entry*)*, void (%struct.sk_buff*)*, void (%struct.dst_entry*, %struct.sock*, %struct.sk_buff*, i32, i1)*, void (%struct.dst_entry*, %struct.sock*, %struct.sk_buff*)*, i32 (%struct.net*, %struct.sock*, %struct.sk_buff*)*, %struct.neighbour* (%struct.dst_entry*, %struct.sk_buff*, i8*)*, void (%struct.dst_entry*, i8*)*, %struct.kmem_cache*, %struct.percpu_counter, [24 x i8] }
%struct.dst_entry = type opaque
%struct.percpu_counter = type { %struct.raw_spinlock, i64, %struct.list_head, i32* }
%struct.rt6_info = type opaque
%struct.fib6_table = type opaque
%struct.seg6_pernet_data = type opaque
%struct.anon.65 = type { %struct.hlist_head, %struct.spinlock, i32 }
%struct.netns_ieee802154_lowpan = type { %struct.netns_sysctl_lowpan, %struct.fqdir* }
%struct.netns_sysctl_lowpan = type { %struct.ctl_table_header* }
%struct.netns_sctp = type { %struct.sctp_mib*, %struct.proc_dir_entry*, %struct.ctl_table_header*, %struct.sock*, %struct.list_head, %struct.list_head, %struct.timer_list, %struct.list_head, %struct.spinlock, %struct.spinlock, i32, i32, i32, i32, i32, i32, i32, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64 }
%struct.sctp_mib = type opaque
%struct.netns_dccp = type { %struct.sock*, %struct.sock* }
%struct.netns_nf = type { %struct.proc_dir_entry*, %struct.nf_queue_handler*, [13 x %struct.nf_logger*], %struct.ctl_table_header*, [5 x %struct.nf_hook_entries*], [5 x %struct.nf_hook_entries*], [3 x %struct.nf_hook_entries*], [5 x %struct.nf_hook_entries*], [7 x %struct.nf_hook_entries*], i8, i8 }
%struct.nf_queue_handler = type opaque
%struct.nf_logger = type opaque
%struct.netns_xt = type { [13 x %struct.list_head], i8, i8, %struct.ebt_table*, %struct.ebt_table*, %struct.ebt_table* }
%struct.ebt_table = type opaque
%struct.netns_ct = type { %struct.atomic_t, i32, %struct.delayed_work, i8, i8, %struct.ctl_table_header*, i32, i32, i32, i32, i32, i32, %struct.ct_pcpu*, %struct.ip_conntrack_stat*, %struct.nf_ct_event_notifier*, %struct.nf_exp_event_notifier*, %struct.nf_ip_net, i32 }
%struct.ct_pcpu = type { %struct.spinlock, %struct.hlist_nulls_head, %struct.hlist_nulls_head }
%struct.hlist_nulls_head = type { %struct.hlist_nulls_node* }
%struct.hlist_nulls_node = type { %struct.hlist_nulls_node*, %struct.hlist_nulls_node** }
%struct.ip_conntrack_stat = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.nf_ct_event_notifier = type opaque
%struct.nf_exp_event_notifier = type opaque
%struct.nf_ip_net = type { %struct.nf_generic_net, %struct.nf_tcp_net, %struct.nf_udp_net, %struct.nf_icmp_net, %struct.nf_icmp_net, %struct.nf_dccp_net, %struct.nf_sctp_net, %struct.nf_gre_net }
%struct.nf_generic_net = type { i32 }
%struct.nf_tcp_net = type { [14 x i32], i32, i32, i32 }
%struct.nf_udp_net = type { [2 x i32] }
%struct.nf_icmp_net = type { i32 }
%struct.nf_dccp_net = type { i32, [10 x i32] }
%struct.nf_sctp_net = type { [10 x i32] }
%struct.nf_gre_net = type { %struct.list_head, [2 x i32] }
%struct.netns_nftables = type { %struct.list_head, %struct.list_head, %struct.list_head, %struct.mutex, i32, i8, i8 }
%struct.netns_nf_frag = type { %struct.fqdir* }
%struct.sk_buff_head = type { %struct.sk_buff*, %struct.sk_buff*, i32, %struct.spinlock }
%struct.net_generic = type opaque
%struct.netns_bpf = type { [1 x %struct.bpf_prog*], [1 x %struct.bpf_link*] }
%struct.bpf_link = type { %struct.atomic64_t, i32, i32, %struct.bpf_link_ops*, %struct.bpf_prog*, %struct.work_struct }
%struct.bpf_link_ops = type { void (%struct.bpf_link*)*, void (%struct.bpf_link*)*, i32 (%struct.bpf_link*, %struct.bpf_prog*, %struct.bpf_prog*)*, void (%struct.bpf_link*, %struct.seq_file*)*, i32 (%struct.bpf_link*, %struct.bpf_link_info*)* }
%struct.bpf_link_info = type { i32, i32, i32, %union.anon.66 }
%union.anon.66 = type { %struct.anon.67 }
%struct.anon.67 = type { i64, i32 }
%struct.netns_xfrm = type { %struct.list_head, %struct.hlist_head*, %struct.hlist_head*, %struct.hlist_head*, i32, i32, %struct.work_struct, %struct.list_head, %struct.hlist_head*, i32, [3 x %struct.hlist_head], [3 x %struct.xfrm_policy_hash], [6 x i32], %struct.work_struct, %struct.xfrm_policy_hthresh, %struct.list_head, %struct.sock*, %struct.sock*, i32, i32, i32, i32, %struct.ctl_table_header*, [32 x i8], %struct.dst_ops, %struct.dst_ops, %struct.spinlock, %struct.spinlock, %struct.mutex, [16 x i8] }
%struct.xfrm_policy_hash = type { %struct.hlist_head*, i32, i8, i8, i8, i8 }
%struct.xfrm_policy_hthresh = type { %struct.work_struct, %struct.seqlock_t, i8, i8, i8, i8 }
%struct.netns_ipvs = type opaque
%struct.netns_mpls = type { i32, i32, i64, %struct.mpls_route**, %struct.ctl_table_header* }
%struct.mpls_route = type opaque
%struct.netns_can = type { %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.can_dev_rcv_lists*, %struct.spinlock, %struct.timer_list, %struct.can_pkg_stats*, %struct.can_rcv_lists_stats*, %struct.hlist_head }
%struct.can_dev_rcv_lists = type opaque
%struct.can_pkg_stats = type opaque
%struct.can_rcv_lists_stats = type opaque
%struct.netns_xdp = type { %struct.mutex, %struct.hlist_head }
%struct.time_namespace = type opaque
%struct.cgroup_namespace = type { %struct.refcount_struct, %struct.ns_common, %struct.user_namespace*, %struct.ucounts*, %struct.css_set* }
%struct.signal_struct = type { %struct.refcount_struct, %struct.atomic_t, i32, %struct.list_head, %struct.wait_queue_head, %struct.task_struct*, %struct.sigpending, %struct.hlist_head, i32, i32, %struct.task_struct*, i32, i32, i8, i32, %struct.list_head, %struct.hrtimer, i64, [2 x %struct.cpu_itimer], %struct.thread_group_cputimer, %struct.posix_cputimers, [4 x %struct.pid*], %struct.pid*, i32, %struct.tty_struct*, %struct.autogroup*, %struct.seqlock_t, i64, i64, i64, i64, i64, i64, %struct.prev_cputime, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, %struct.task_io_accounting, i64, [16 x %struct.rlimit], %struct.pacct_struct, %struct.taskstats*, i32, %struct.tty_audit_buf*, i8, i16, i16, %struct.mm_struct*, %struct.mutex, %struct.mutex }
%struct.cpu_itimer = type { i64, i64 }
%struct.thread_group_cputimer = type { %struct.task_cputime_atomic }
%struct.task_cputime_atomic = type { %struct.atomic64_t, %struct.atomic64_t, %struct.atomic64_t }
%struct.tty_struct = type opaque
%struct.autogroup = type opaque
%struct.rlimit = type { i64, i64 }
%struct.pacct_struct = type { i32, i64, i64, i64, i64, i64, i64 }
%struct.taskstats = type { i16, i32, i8, i8, i64, i64, i64, i64, i64, i64, i64, i64, [32 x i8], i8, [3 x i8], [4 x i8], i32, i32, i32, i32, i32, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.tty_audit_buf = type opaque
%struct.sighand_struct = type { %struct.spinlock, %struct.refcount_struct, %struct.wait_queue_head, [64 x %struct.k_sigaction] }
%struct.k_sigaction = type { %struct.sigaction }
%struct.sigaction = type { void (i32)*, i64, void ()*, %struct.sigset_t }
%struct.sigset_t = type { [1 x i64] }
%struct.sigpending = type { %struct.list_head, %struct.sigset_t }
%struct.audit_context = type opaque
%struct.kuid_t = type { i32 }
%struct.seccomp = type { i32, %struct.seccomp_filter* }
%struct.seccomp_filter = type opaque
%struct.wake_q_node = type { %struct.wake_q_node* }
%struct.rb_root_cached = type { %struct.rb_root, %struct.rb_node* }
%struct.rt_mutex_waiter = type opaque
%struct.mutex_waiter = type { %struct.list_head, %struct.task_struct*, %struct.ww_acquire_ctx*, i8* }
%struct.ww_acquire_ctx = type opaque
%struct.held_lock = type { i64, i64, %struct.lockdep_map*, %struct.lockdep_map*, i64, i64, i32, i32 }
%struct.bio_list = type opaque
%struct.blk_plug = type opaque
%struct.reclaim_state = type opaque
%struct.backing_dev_info = type opaque
%struct.io_context = type { %struct.atomic64_t, %struct.atomic_t, %struct.atomic_t, %struct.spinlock, i16, i32, i64, %struct.xarray, %struct.io_cq*, %struct.hlist_head, %struct.work_struct }
%struct.io_cq = type { %struct.request_queue*, %struct.io_context*, %union.anon.90, %union.anon.91, i32 }
%union.anon.90 = type { %struct.list_head }
%union.anon.91 = type { %struct.hlist_node }
%struct.capture_control = type opaque
%struct.kernel_siginfo = type { %struct.anon.92 }
%struct.anon.92 = type { i32, i32, i32, %union.__sifields }
%union.__sifields = type { %struct.anon.96 }
%struct.anon.96 = type { i32, i32, i32, i64, i64 }
%struct.task_io_accounting = type { i64, i64, i64, i64, i64, i64, i64 }
%struct.nodemask_t = type { [16 x i64] }
%struct.seqcount = type { i32, %struct.lockdep_map }
%struct.css_set = type { [14 x %struct.cgroup_subsys_state*], %struct.refcount_struct, %struct.css_set*, %struct.cgroup*, i32, %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, [14 x %struct.list_head], %struct.list_head, %struct.list_head, %struct.hlist_node, %struct.list_head, %struct.list_head, %struct.list_head, %struct.cgroup*, %struct.cgroup*, %struct.css_set*, i8, %struct.callback_head }
%struct.cgroup_subsys_state = type { %struct.cgroup*, %struct.cgroup_subsys*, %struct.percpu_ref, %struct.list_head, %struct.list_head, %struct.list_head, i32, i32, i64, %struct.atomic_t, %struct.work_struct, %struct.rcu_work, %struct.cgroup_subsys_state* }
%struct.cgroup_subsys = type { %struct.cgroup_subsys_state* (%struct.cgroup_subsys_state*)*, i32 (%struct.cgroup_subsys_state*)*, void (%struct.cgroup_subsys_state*)*, void (%struct.cgroup_subsys_state*)*, void (%struct.cgroup_subsys_state*)*, void (%struct.cgroup_subsys_state*)*, void (%struct.cgroup_subsys_state*, i32)*, i32 (%struct.seq_file*, %struct.cgroup_subsys_state*)*, i32 (%struct.cgroup_taskset*)*, void (%struct.cgroup_taskset*)*, void (%struct.cgroup_taskset*)*, void ()*, i32 (%struct.task_struct*, %struct.css_set*)*, void (%struct.task_struct*, %struct.css_set*)*, void (%struct.task_struct*)*, void (%struct.task_struct*)*, void (%struct.task_struct*)*, void (%struct.cgroup_subsys_state*)*, i8, i32, i8*, i8*, %struct.cgroup_root*, %struct.idr, %struct.list_head, %struct.cftype*, %struct.cftype*, i32 }
%struct.cgroup_taskset = type opaque
%struct.cgroup_root = type { %struct.kernfs_root*, i32, i32, %struct.cgroup, i64, %struct.atomic_t, %struct.list_head, i32, [4096 x i8], [64 x i8] }
%struct.kernfs_root = type { %struct.kernfs_node*, i32, %struct.idr, i32, i32, %struct.kernfs_syscall_ops*, %struct.list_head, %struct.wait_queue_head }
%struct.kernfs_syscall_ops = type { i32 (%struct.seq_file*, %struct.kernfs_root*)*, i32 (%struct.kernfs_node*, i8*, i16)*, i32 (%struct.kernfs_node*)*, i32 (%struct.kernfs_node*, %struct.kernfs_node*, i8*)*, i32 (%struct.seq_file*, %struct.kernfs_node*, %struct.kernfs_root*)* }
%struct.cgroup = type { %struct.cgroup_subsys_state, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.kernfs_node*, %struct.cgroup_file, %struct.cgroup_file, i16, i16, i16, i16, [14 x %struct.cgroup_subsys_state*], %struct.cgroup_root*, %struct.list_head, [14 x %struct.list_head], %struct.cgroup*, %struct.cgroup*, %struct.cgroup_rstat_cpu*, %struct.list_head, %struct.cgroup_base_stat, %struct.cgroup_base_stat, %struct.prev_cputime, %struct.list_head, %struct.mutex, %struct.wait_queue_head, %struct.work_struct, %struct.psi_group, %struct.cgroup_bpf, %struct.atomic_t, %struct.cgroup_freezer_state, [0 x i64] }
%struct.cgroup_file = type { %struct.kernfs_node*, i64, %struct.timer_list }
%struct.cgroup_rstat_cpu = type { %struct.u64_stats_sync, %struct.cgroup_base_stat, %struct.cgroup_base_stat, %struct.cgroup*, %struct.cgroup* }
%struct.cgroup_base_stat = type { %struct.task_cputime }
%struct.task_cputime = type { i64, i64, i64 }
%struct.psi_group = type { %struct.mutex, %struct.psi_group_cpu*, [5 x i64], i64, i64, %struct.delayed_work, [2 x [5 x i64]], [5 x [3 x i64]], %struct.atomic_t, %struct.kthread_worker*, %struct.kthread_delayed_work, %struct.mutex, %struct.list_head, [5 x i32], i32, i64, [5 x i64], i64, i64 }
%struct.psi_group_cpu = type { %struct.seqcount, [4 x i32], i32, [6 x i32], i64, [16 x i8], [2 x [6 x i32]], [16 x i8] }
%struct.kthread_worker = type { i32, %struct.raw_spinlock, %struct.list_head, %struct.list_head, %struct.task_struct*, %struct.kthread_work* }
%struct.kthread_work = type { %struct.list_head, void (%struct.kthread_work*)*, %struct.kthread_worker*, i32 }
%struct.kthread_delayed_work = type { %struct.kthread_work, %struct.timer_list }
%struct.cgroup_bpf = type { [34 x %struct.bpf_prog_array*], [34 x %struct.list_head], [34 x i32], %struct.bpf_prog_array*, %struct.percpu_ref, %struct.work_struct }
%struct.bpf_prog_array = type { %struct.callback_head, [0 x %struct.bpf_prog_array_item] }
%struct.bpf_prog_array_item = type { %struct.bpf_prog*, [2 x %struct.bpf_cgroup_storage*] }
%struct.bpf_cgroup_storage = type { %union.anon.89, %struct.bpf_cgroup_storage_map*, %struct.bpf_cgroup_storage_key, %struct.list_head, %struct.rb_node, %struct.callback_head }
%union.anon.89 = type { %struct.bpf_storage_buffer* }
%struct.bpf_storage_buffer = type { %struct.callback_head, [0 x i8] }
%struct.bpf_cgroup_storage_map = type opaque
%struct.bpf_cgroup_storage_key = type { i64, i32 }
%struct.cgroup_freezer_state = type { i8, i32, i32, i32 }
%struct.cftype = type { [64 x i8], i64, i64, i32, i32, %struct.cgroup_subsys*, %struct.list_head, %struct.kernfs_ops*, i32 (%struct.kernfs_open_file*)*, void (%struct.kernfs_open_file*)*, i64 (%struct.cgroup_subsys_state*, %struct.cftype*)*, i64 (%struct.cgroup_subsys_state*, %struct.cftype*)*, i32 (%struct.seq_file*, i8*)*, i8* (%struct.seq_file*, i64*)*, i8* (%struct.seq_file*, i8*, i64*)*, void (%struct.seq_file*, i8*)*, i32 (%struct.cgroup_subsys_state*, %struct.cftype*, i64)*, i32 (%struct.cgroup_subsys_state*, %struct.cftype*, i64)*, i64 (%struct.kernfs_open_file*, i8*, i64, i64)*, i32 (%struct.kernfs_open_file*, %struct.poll_table_struct*)*, %struct.lock_class_key }
%struct.percpu_ref = type { %struct.atomic64_t, i64, void (%struct.percpu_ref*)*, void (%struct.percpu_ref*)*, i8, %struct.callback_head }
%struct.rcu_work = type { %struct.work_struct, %struct.callback_head, %struct.workqueue_struct* }
%struct.robust_list_head = type opaque
%struct.compat_robust_list_head = type { %struct.compat_robust_list, i32, i32 }
%struct.compat_robust_list = type { i32 }
%struct.futex_pi_state = type opaque
%struct.perf_event_context = type opaque
%struct.mempolicy = type opaque
%struct.numa_group = type opaque
%struct.rseq = type { i32, i32, %union.anon.103, i32, [12 x i8] }
%union.anon.103 = type { i64 }
%struct.tlbflush_unmap_batch = type { %struct.arch_tlbflush_unmap_batch, i8, i8 }
%struct.arch_tlbflush_unmap_batch = type { %struct.cpumask }
%union.anon.104 = type { %struct.callback_head }
%struct.pipe_inode_info = type { %struct.mutex, %struct.wait_queue_head, %struct.wait_queue_head, i32, i32, i32, i32, i8, i32, i32, i32, i32, i32, i32, %struct.page*, %struct.fasync_struct*, %struct.fasync_struct*, %struct.pipe_buffer*, %struct.user_struct*, %struct.watch_queue* }
%struct.pipe_buffer = type { %struct.page*, i32, i32, %struct.pipe_buf_operations*, i32, i64 }
%struct.pipe_buf_operations = type { i32 (%struct.pipe_inode_info*, %struct.pipe_buffer*)*, void (%struct.pipe_inode_info*, %struct.pipe_buffer*)*, i1 (%struct.pipe_inode_info*, %struct.pipe_buffer*)*, i1 (%struct.pipe_inode_info*, %struct.pipe_buffer*)* }
%struct.watch_queue = type opaque
%struct.page_frag = type { %struct.page*, i32, i32 }
%struct.task_delay_info = type opaque
%struct.latency_record = type { [12 x i64], i32, i64, i64 }
%struct.ftrace_ret_stack = type opaque
%struct.kcov = type opaque
%struct.mem_cgroup = type opaque
%struct.request_queue = type opaque
%struct.uprobe_task = type { i32, %union.anon.105, %struct.uprobe*, i64, %struct.return_instance*, i32 }
%union.anon.105 = type { %struct.anon.106 }
%struct.anon.106 = type { %struct.arch_uprobe_task, i64 }
%struct.arch_uprobe_task = type { i64, i32, i32 }
%struct.uprobe = type opaque
%struct.return_instance = type { %struct.uprobe*, i64, i64, i64, i8, %struct.return_instance* }
%struct.vm_struct = type { %struct.vm_struct*, i8*, i64, i64, %struct.page**, i32, i64, i8* }
%struct.refcount_struct = type { %struct.atomic_t }
%struct.callback_head = type { %struct.callback_head*, void (%struct.callback_head*)* }
%struct.thread_struct = type { [3 x %struct.desc_struct], i64, i16, i16, i16, i16, i64, i64, [4 x %struct.perf_event*], i64, i64, i64, i64, i64, %struct.io_bitmap*, i64, %struct.mm_segment_t, i8, [39 x i8], %struct.fpu }
%struct.desc_struct = type { i16, i16, i32 }
%struct.perf_event = type opaque
%struct.io_bitmap = type opaque
%struct.mm_segment_t = type { i64 }
%struct.fpu = type { i32, i64, [48 x i8], %union.fpregs_state }
%union.fpregs_state = type { %struct.xregs_state, [3520 x i8] }
%struct.xregs_state = type { %struct.fxregs_state, %struct.xstate_header, [0 x i8] }
%struct.fxregs_state = type { i16, i16, i16, i16, %union.anon.108, i32, i32, [32 x i32], [64 x i32], [12 x i32], %union.anon.111 }
%union.anon.108 = type { %struct.anon.109 }
%struct.anon.109 = type { i64, i64 }
%union.anon.111 = type { [12 x i32] }
%struct.xstate_header = type { i64, i64, [6 x i64] }
%struct.bpf_tramp_progs = type { [40 x %struct.bpf_prog*], i32 }
%struct.x64_jit_data = type { %struct.bpf_binary_header*, i32*, i8*, i32, %struct.jit_context }
%struct.bpf_binary_header = type { i32, [4 x i8], [0 x i8] }
%struct.jit_context = type { i32 }
%struct.bpf_array = type { %struct.bpf_map, i32, i32, %struct.bpf_array_aux*, %union.anon.146, [48 x i8] }
%struct.bpf_array_aux = type { i32, i8, %struct.list_head, %struct.bpf_map*, %struct.mutex, %struct.work_struct }
%union.anon.146 = type { [0 x i8*] }
%struct.pt_regs = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }

@.str = private unnamed_addr constant [28 x i8] c"arch/x86/net/bpf_jit_comp.c\00", align 1
@.str.1 = private unnamed_addr constant [40 x i8] c"\013bpf_jit: proglen=%d != oldproglen=%d\0A\00", align 1
@bpf_jit_enable = external dso_local local_unnamed_addr global i32, align 4
@_stext = external dso_local global [0 x i8], align 1
@_etext = external dso_local global [0 x i8], align 1
@ideal_nops = external dso_local local_unnamed_addr global i8**, align 8
@text_mutex = external dso_local global %struct.mutex, align 8
@.str.2 = private unnamed_addr constant [34 x i8] c"\013Target call %p is out of range\0A\00", align 1
@reg2hex = internal unnamed_addr constant [15 x i32] [i32 0, i32 7, i32 6, i32 2, i32 1, i32 0, i32 3, i32 5, i32 6, i32 7, i32 5, i32 2, i32 0, i32 3, i32 1], align 16
@.str.3 = private unnamed_addr constant [29 x i8] c"\013Target %p is out of range\0A\00", align 1
@kmalloc_caches = external dso_local local_unnamed_addr global [3 x [14 x %struct.kmem_cache*]], align 16
@.str.5 = private unnamed_addr constant [14 x i8] c"\013ex gen bug\0A\00", align 1
@.str.6 = private unnamed_addr constant [41 x i8] c"\013extable->insn doesn't fit into 32-bit\0A\00", align 1
@.str.7 = private unnamed_addr constant [44 x i8] c"\013extable->handler doesn't fit into 32-bit\0A\00", align 1
@.str.8 = private unnamed_addr constant [18 x i8] c"\013verifier error\0A\00", align 1
@reg2pt_regs = internal unnamed_addr constant [10 x i32] [i32 80, i32 112, i32 104, i32 96, i32 88, i32 72, i32 40, i32 16, i32 8, i32 0], align 16
@.str.11 = private unnamed_addr constant [32 x i8] c"\013bpf_jit: unknown opcode %02x\0A\00", align 1
@.str.12 = private unnamed_addr constant [34 x i8] c"\013bpf_jit: fatal insn size error\0A\00", align 1
@.str.13 = private unnamed_addr constant [24 x i8] c"\013bpf_jit: fatal error\0A\00", align 1
@.str.14 = private unnamed_addr constant [28 x i8] c"\013extable is not populated\0A\00", align 1
@.str.15 = private unnamed_addr constant [55 x i8] c"\013flen=%u proglen=%u pass=%u image=%pK from=%s pid=%d\0A\00", align 1
@.str.16 = private unnamed_addr constant [3 x i8] c"\013\00", align 1
@.str.17 = private unnamed_addr constant [11 x i8] c"JIT code: \00", align 1
@current_task = external dso_local global %struct.task_struct*, section ".data..percpu", align 8
@switch.table.arch_prepare_bpf_trampoline.19 = private unnamed_addr constant [8 x i32] [i32 16, i32 8, i32 -22, i32 0, i32 -22, i32 -22, i32 -22, i32 24], align 4
@switch.table.bpf_int_jit_compile = private unnamed_addr constant [11 x i32] [i32 1, i32 41, i32 0, i32 0, i32 9, i32 33, i32 0, i32 0, i32 0, i32 0, i32 49], align 4
@switch.table.bpf_int_jit_compile.20 = private unnamed_addr constant [11 x i8] c"\05-\00\00\0D%\00\00\00\005", align 1
@switch.table.bpf_int_jit_compile.21 = private unnamed_addr constant [11 x i8] c"\C0\E8\00\00\C8\E0\00\00\00\00\F0", align 1
@switch.table.bpf_int_jit_compile.22 = private unnamed_addr constant [13 x i8] c"twsuu\7F}ttrv|~", align 1
@__sancov_lowest_stack = external thread_local(initialexec) global i64
@__sancov_gen_cov_switch_values = internal global [6 x i64] [i64 4, i64 32, i64 0, i64 1, i64 2, i64 3]
@__sancov_gen_cov_switch_values.23 = internal global [6 x i64] [i64 4, i64 32, i64 0, i64 1, i64 2, i64 3]
@__sancov_gen_cov_switch_values.24 = internal global [121 x i64] [i64 119, i64 8, i64 4, i64 5, i64 7, i64 12, i64 15, i64 20, i64 21, i64 22, i64 23, i64 24, i64 28, i64 29, i64 30, i64 31, i64 33, i64 36, i64 37, i64 38, i64 39, i64 41, i64 44, i64 45, i64 46, i64 47, i64 49, i64 52, i64 53, i64 54, i64 55, i64 57, i64 60, i64 61, i64 62, i64 63, i64 68, i64 69, i64 70, i64 71, i64 76, i64 77, i64 78, i64 79, i64 84, i64 85, i64 86, i64 87, i64 92, i64 93, i64 94, i64 95, i64 97, i64 98, i64 99, i64 100, i64 101, i64 102, i64 103, i64 105, i64 106, i64 107, i64 108, i64 109, i64 110, i64 111, i64 113, i64 114, i64 115, i64 116, i64 117, i64 118, i64 119, i64 121, i64 122, i64 123, i64 124, i64 125, i64 126, i64 127, i64 132, i64 133, i64 135, i64 148, i64 149, i64 151, i64 156, i64 159, i64 164, i64 165, i64 166, i64 167, i64 172, i64 173, i64 174, i64 175, i64 180, i64 181, i64 182, i64 183, i64 188, i64 189, i64 190, i64 191, i64 195, i64 196, i64 197, i64 198, i64 199, i64 204, i64 205, i64 206, i64 207, i64 212, i64 213, i64 214, i64 219, i64 220, i64 221, i64 222, i64 245]
@__sancov_gen_cov_switch_values.25 = internal global [5 x i64] [i64 3, i64 8, i64 96, i64 112, i64 192]
@__sancov_gen_cov_switch_values.26 = internal global [5 x i64] [i64 3, i64 8, i64 96, i64 112, i64 192]
@__sancov_gen_cov_switch_values.27 = internal global [5 x i64] [i64 3, i64 32, i64 16, i64 32, i64 64]
@__sancov_gen_cov_switch_values.28 = internal global [4 x i64] [i64 2, i64 32, i64 16, i64 32]
@__sancov_gen_cov_switch_values.29 = internal global [6 x i64] [i64 4, i64 32, i64 0, i64 1, i64 2, i64 3]

; Function Attrs: noredzone nounwind sanitize_address sspstrong
define dso_local i32 @bpf_arch_text_poke(i8* %ip, i32 %t, i8* %old_addr, i8* %new_addr) local_unnamed_addr #0 {
entry:
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %0 = ptrtoint i8* %ip to i64
  %cmp.i = icmp ult i8* %ip, getelementptr inbounds ([0 x i8], [0 x i8]* @_stext, i64 0, i64 0)
  %cmp1.i = icmp ugt i8* %ip, getelementptr inbounds ([0 x i8], [0 x i8]* @_etext, i64 0, i64 0)
  %or.cond.i = or i1 %cmp.i, %cmp1.i
  br i1 %or.cond.i, label %is_kernel_text.exit, label %entry.if.end_crit_edge

entry.if.end_crit_edge:                           ; preds = %entry
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end

is_kernel_text.exit:                              ; preds = %entry
  %call2.i = tail call i32 @in_gate_area_no_mm(i64 %0) #13
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %call2.i)
  %tobool = icmp eq i32 %call2.i, 0
  br i1 %tobool, label %land.lhs.true, label %is_kernel_text.exit.if.end_crit_edge

is_kernel_text.exit.if.end_crit_edge:             ; preds = %is_kernel_text.exit
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end

land.lhs.true:                                    ; preds = %is_kernel_text.exit
  %call1 = tail call zeroext i1 @is_bpf_text_address(i64 %0) #13
  br i1 %call1, label %land.lhs.true.if.end_crit_edge, label %land.lhs.true.return_crit_edge

land.lhs.true.return_crit_edge:                   ; preds = %land.lhs.true
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %return

land.lhs.true.if.end_crit_edge:                   ; preds = %land.lhs.true
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %is_kernel_text.exit.if.end_crit_edge, %entry.if.end_crit_edge
  %call2 = tail call fastcc i32 @__bpf_arch_text_poke(i8* %ip, i32 %t, i8* %old_addr, i8* %new_addr, i1 zeroext true) #14
  br label %return

return:                                           ; preds = %land.lhs.true.return_crit_edge, %if.end
  %retval.0 = phi i32 [ %call2, %if.end ], [ -22, %land.lhs.true.return_crit_edge ]
  ret i32 %retval.0
}

; Function Attrs: noredzone
declare dso_local zeroext i1 @is_bpf_text_address(i64) local_unnamed_addr #1

; Function Attrs: noredzone nounwind sanitize_address sspstrong
define internal fastcc i32 @__bpf_arch_text_poke(i8* %ip, i32 %t, i8* %old_addr, i8* %new_addr, i1 zeroext %text_live) unnamed_addr #0 {
entry:
  %old_insn = alloca [5 x i8], align 1
  %new_insn = alloca [5 x i8], align 1
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  call void @__asan_load8_noabort(i64 ptrtoint (i8*** @ideal_nops to i64))
  %0 = load i8**, i8*** @ideal_nops, align 8
  %arrayidx = getelementptr i8*, i8** %0, i64 9
  %1 = ptrtoint i8** %arrayidx to i64
  call void @__asan_load8_noabort(i64 %1)
  %2 = load i8*, i8** %arrayidx, align 8
  %3 = getelementptr inbounds [5 x i8], [5 x i8]* %old_insn, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %3) #15
  %4 = getelementptr inbounds [5 x i8], [5 x i8]* %old_insn, i64 0, i64 1
  %5 = getelementptr inbounds [5 x i8], [5 x i8]* %new_insn, i64 0, i64 0
  %6 = call i8* @memset(i8* %3, i32 170, i64 5)
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %5) #15
  %7 = getelementptr inbounds [5 x i8], [5 x i8]* %new_insn, i64 0, i64 1
  %8 = call i8* @memset(i8* %5, i32 170, i64 5)
  %call = call i8* @memcpy(i8* nonnull %3, i8* %2, i64 5) #14
  %tobool = icmp eq i8* %old_addr, null
  br i1 %tobool, label %entry.if.end6_crit_edge, label %if.then

entry.if.end6_crit_edge:                          ; preds = %entry
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end6

if.then:                                          ; preds = %entry
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %t)
  %cmp = icmp eq i32 %t, 0
  %add.ptr.i.i = getelementptr i8, i8* %ip, i64 5
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %old_addr to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %add.ptr.i.i to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %9 = add i64 %sub.ptr.sub.i.i, 2147483648
  call void @__sanitizer_cov_trace_const_cmp8(i64 4294967296, i64 %9)
  %10 = icmp ult i64 %9, 4294967296
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  br i1 %10, label %do.body2.i.i, label %if.then.i.i

if.then.i.i:                                      ; preds = %cond.true
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %call1.i.i = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.2, i64 0, i64 0), i8* nonnull %old_addr) #16
  br label %cleanup

do.body2.i.i:                                     ; preds = %cond.true
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %11 = ptrtoint i8* %3 to i64
  call void @__asan_store1_noabort(i64 %11)
  store i8 -24, i8* %3, align 1
  %conv5.i.i = trunc i64 %sub.ptr.sub.i.i to i32
  %12 = bitcast i8* %4 to i32*
  %13 = ptrtoint i32* %12 to i64
  call void @__asan_store4_noabort(i64 %13)
  store i32 %conv5.i.i, i32* %12, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  br label %if.end6

cond.false:                                       ; preds = %if.then
  br i1 %10, label %do.body2.i.i66, label %if.then.i.i62

if.then.i.i62:                                    ; preds = %cond.false
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %call1.i.i61 = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.2, i64 0, i64 0), i8* nonnull %old_addr) #16
  br label %cleanup

do.body2.i.i66:                                   ; preds = %cond.false
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %14 = ptrtoint i8* %3 to i64
  call void @__asan_store1_noabort(i64 %14)
  store i8 -23, i8* %3, align 1
  %conv5.i.i64 = trunc i64 %sub.ptr.sub.i.i to i32
  %15 = bitcast i8* %4 to i32*
  %16 = ptrtoint i32* %15 to i64
  call void @__asan_store4_noabort(i64 %16)
  store i32 %conv5.i.i64, i32* %15, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  br label %if.end6

if.end6:                                          ; preds = %entry.if.end6_crit_edge, %do.body2.i.i66, %do.body2.i.i
  %call8 = call i8* @memcpy(i8* nonnull %5, i8* %2, i64 5) #14
  %tobool9 = icmp eq i8* %new_addr, null
  br i1 %tobool9, label %if.end6.if.end22_crit_edge, label %if.then10

if.end6.if.end22_crit_edge:                       ; preds = %if.end6
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end22

if.then10:                                        ; preds = %if.end6
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %t)
  %cmp12 = icmp eq i32 %t, 0
  %add.ptr.i.i68 = getelementptr i8, i8* %ip, i64 5
  %sub.ptr.lhs.cast.i.i69 = ptrtoint i8* %new_addr to i64
  %sub.ptr.rhs.cast.i.i70 = ptrtoint i8* %add.ptr.i.i68 to i64
  %sub.ptr.sub.i.i71 = sub i64 %sub.ptr.lhs.cast.i.i69, %sub.ptr.rhs.cast.i.i70
  %17 = add i64 %sub.ptr.sub.i.i71, 2147483648
  call void @__sanitizer_cov_trace_const_cmp8(i64 4294967296, i64 %17)
  %18 = icmp ult i64 %17, 4294967296
  br i1 %cmp12, label %cond.true13, label %cond.false15

cond.true13:                                      ; preds = %if.then10
  br i1 %18, label %do.body2.i.i77, label %if.then.i.i73

if.then.i.i73:                                    ; preds = %cond.true13
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %call1.i.i72 = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.2, i64 0, i64 0), i8* nonnull %new_addr) #16
  br label %cleanup

do.body2.i.i77:                                   ; preds = %cond.true13
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %19 = ptrtoint i8* %5 to i64
  call void @__asan_store1_noabort(i64 %19)
  store i8 -24, i8* %5, align 1
  %conv5.i.i75 = trunc i64 %sub.ptr.sub.i.i71 to i32
  %20 = bitcast i8* %7 to i32*
  %21 = ptrtoint i32* %20 to i64
  call void @__asan_store4_noabort(i64 %21)
  store i32 %conv5.i.i75, i32* %20, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  br label %if.end22

cond.false15:                                     ; preds = %if.then10
  br i1 %18, label %do.body2.i.i89, label %if.then.i.i85

if.then.i.i85:                                    ; preds = %cond.false15
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %call1.i.i84 = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.2, i64 0, i64 0), i8* nonnull %new_addr) #16
  br label %cleanup

do.body2.i.i89:                                   ; preds = %cond.false15
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %22 = ptrtoint i8* %5 to i64
  call void @__asan_store1_noabort(i64 %22)
  store i8 -23, i8* %5, align 1
  %conv5.i.i87 = trunc i64 %sub.ptr.sub.i.i71 to i32
  %23 = bitcast i8* %7 to i32*
  %24 = ptrtoint i32* %23 to i64
  call void @__asan_store4_noabort(i64 %24)
  store i32 %conv5.i.i87, i32* %23, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  br label %if.end22

if.end22:                                         ; preds = %if.end6.if.end22_crit_edge, %do.body2.i.i89, %do.body2.i.i77
  call void @mutex_lock_nested(%struct.mutex* nonnull @text_mutex, i32 0) #13
  %call24 = call i32 @memcmp(i8* %ip, i8* nonnull %3, i64 5) #17
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %call24)
  %tobool25 = icmp eq i32 %call24, 0
  br i1 %tobool25, label %if.end27, label %if.end22.out_crit_edge

if.end22.out_crit_edge:                           ; preds = %if.end22
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %out

if.end27:                                         ; preds = %if.end22
  %call29 = call i32 @memcmp(i8* %ip, i8* nonnull %5, i64 5) #17
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %call29)
  %tobool30 = icmp eq i32 %call29, 0
  br i1 %tobool30, label %if.end27.out_crit_edge, label %if.then31

if.end27.out_crit_edge:                           ; preds = %if.end27
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %out

if.then31:                                        ; preds = %if.end27
  br i1 %text_live, label %if.then33, label %if.else

if.then33:                                        ; preds = %if.then31
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  call void @text_poke_bp(i8* %ip, i8* nonnull %5, i64 5, i8* null) #13
  br label %out

if.else:                                          ; preds = %if.then31
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %call36 = call i8* @memcpy(i8* %ip, i8* nonnull %5, i64 5) #14
  br label %out

out:                                              ; preds = %if.end27.out_crit_edge, %if.end22.out_crit_edge, %if.else, %if.then33
  %ret.0 = phi i32 [ -16, %if.end22.out_crit_edge ], [ 0, %if.end27.out_crit_edge ], [ 0, %if.then33 ], [ 0, %if.else ]
  call void @mutex_unlock(%struct.mutex* nonnull @text_mutex) #13
  br label %cleanup

cleanup:                                          ; preds = %if.then.i.i73, %if.then.i.i85, %if.then.i.i, %if.then.i.i62, %out
  %retval.0 = phi i32 [ %ret.0, %out ], [ -34, %if.then.i.i ], [ -34, %if.then.i.i62 ], [ -34, %if.then.i.i73 ], [ -34, %if.then.i.i85 ]
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %5) #15
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %3) #15
  ret i32 %retval.0
}

; Function Attrs: noredzone nounwind sanitize_address sspstrong
define dso_local i32 @arch_prepare_bpf_trampoline(i8* %image, i8* readnone %image_end, %struct.btf_func_model* nocapture readonly %m, i32 %flags, %struct.bpf_tramp_progs* nocapture readonly %tprogs, i8* %orig_call) local_unnamed_addr #0 {
entry:
  %prog.i287 = alloca i8*, align 8
  %prog.i240 = alloca i8*, align 8
  %prog.i = alloca i8*, align 8
  %prog = alloca i8*, align 8
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %nr_args1 = getelementptr inbounds %struct.btf_func_model, %struct.btf_func_model* %m, i64 0, i32 1
  %0 = ptrtoint i8* %nr_args1 to i64
  call void @__asan_load1_noabort(i64 %0)
  %1 = load i8, i8* %nr_args1, align 1
  %conv = zext i8 %1 to i32
  %mul = shl nuw nsw i32 %conv, 3
  %2 = bitcast i8** %prog to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %2) #15
  %3 = ptrtoint i8** %prog to i64
  call void @__asan_store8_noabort(i64 %3)
  store i8* inttoptr (i64 -6148914691236517206 to i8*), i8** %prog, align 8
  call void @__sanitizer_cov_trace_const_cmp1(i8 6, i8 %1)
  %cmp = icmp ugt i8 %1, 6
  br i1 %cmp, label %entry.cleanup158_crit_edge, label %if.end

entry.cleanup158_crit_edge:                       ; preds = %entry
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %cleanup158

if.end:                                           ; preds = %entry
  %conv5 = zext i32 %flags to i64
  %and = and i64 %conv5, 1
  call void @__sanitizer_cov_trace_const_cmp8(i64 0, i64 %and)
  %tobool = icmp ne i64 %and, 0
  %tobool.not = xor i1 %tobool, true
  %and7 = and i64 %conv5, 4
  call void @__sanitizer_cov_trace_const_cmp8(i64 0, i64 %and7)
  %tobool8 = icmp eq i64 %and7, 0
  %or.cond = or i1 %tobool8, %tobool.not
  br i1 %or.cond, label %if.end10, label %if.end.cleanup158_crit_edge

if.end.cleanup158_crit_edge:                      ; preds = %if.end
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %cleanup158

if.end10:                                         ; preds = %if.end
  %and12 = and i64 %conv5, 2
  call void @__sanitizer_cov_trace_const_cmp8(i64 0, i64 %and12)
  %tobool13 = icmp ne i64 %and12, 0
  %add = add nuw nsw i32 %mul, 8
  %spec.select = select i1 %tobool13, i32 %add, i32 %mul
  call void @__sanitizer_cov_trace_const_cmp8(i64 0, i64 %and7)
  %tobool18 = icmp ne i64 %and7, 0
  %add.ptr = getelementptr i8, i8* %orig_call, i64 5
  %orig_call.addr.0 = select i1 %tobool18, i8* %add.ptr, i8* %orig_call
  %4 = ptrtoint i8* %image to i64
  call void @__asan_store1_noabort(i64 %4)
  store i8 85, i8* %image, align 1
  %add.ptr.i = getelementptr i8, i8* %image, i64 1
  %5 = bitcast i8* %add.ptr.i to i32*
  %6 = ptrtoint i32* %5 to i64
  call void @__asan_store4_noabort(i64 %6)
  store i32 15042888, i32* %5, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i230 = getelementptr i8, i8* %image, i64 4
  %shl = shl i32 %spec.select, 24
  %add28 = or i32 %shl, 15500104
  %7 = bitcast i8* %add.ptr.i230 to i32*
  %8 = ptrtoint i32* %7 to i64
  call void @__asan_store4_noabort(i64 %8)
  store i32 %add28, i32* %7, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i231 = getelementptr i8, i8* %image, i64 8
  %9 = ptrtoint i8* %add.ptr.i231 to i64
  call void @__asan_store1_noabort(i64 %9)
  store i8 83, i8* %add.ptr.i231, align 1
  %add.ptr.i232 = getelementptr i8, i8* %image, i64 9
  %10 = ptrtoint i8** %prog to i64
  call void @__asan_store8_noabort(i64 %10)
  store i8* %add.ptr.i232, i8** %prog, align 8
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %1)
  %cmp156.i = icmp ne i8 %1, 0
  br i1 %cmp156.i, label %for.body.preheader.i, label %if.end10.save_regs.exit_crit_edge

if.end10.save_regs.exit_crit_edge:                ; preds = %if.end10
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %save_regs.exit

for.body.preheader.i:                             ; preds = %if.end10
  call void @__sanitizer_cov_trace_const_cmp4(i32 6, i32 %conv)
  %cmp.i = icmp ult i32 %conv, 6
  %nr_args..i = select i1 %cmp.i, i32 %conv, i32 6
  %11 = zext i32 %nr_args..i to i64
  br label %for.body.i

for.body.i:                                       ; preds = %if.end29.i.for.body.i_crit_edge, %for.body.preheader.i
  %indvars.iv.i = phi i64 [ 0, %for.body.preheader.i ], [ %indvars.iv.next.i, %if.end29.i.for.body.i_crit_edge ]
  %arrayidx.i = getelementptr %struct.btf_func_model, %struct.btf_func_model* %m, i64 0, i32 2, i64 %indvars.iv.i
  %12 = ptrtoint i8* %arrayidx.i to i64
  call void @__asan_load1_noabort(i64 %12)
  %13 = load i8, i8* %arrayidx.i, align 1
  %switch.tableidx = add i8 %13, -1
  call void @__sanitizer_cov_trace_const_cmp1(i8 8, i8 %switch.tableidx)
  %14 = icmp ult i8 %switch.tableidx, 8
  br i1 %14, label %switch.lookup, label %for.body.i.if.end29.i_crit_edge

for.body.i.if.end29.i_crit_edge:                  ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end29.i

switch.lookup:                                    ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %15 = sext i8 %switch.tableidx to i64
  %switch.gep = getelementptr inbounds [8 x i32], [8 x i32]* @switch.table.arch_prepare_bpf_trampoline.19, i64 0, i64 %15
  %16 = ptrtoint i32* %switch.gep to i64
  call void @__asan_load4_noabort(i64 %16)
  %switch.load = load i32, i32* %switch.gep, align 4
  br label %if.end29.i

if.end29.i:                                       ; preds = %for.body.i.if.end29.i_crit_edge, %switch.lookup
  %bpf_size.0.i = phi i32 [ %switch.load, %switch.lookup ], [ -22, %for.body.i.if.end29.i_crit_edge ]
  call void @__sanitizer_cov_trace_const_cmp8(i64 5, i64 %indvars.iv.i)
  %cmp31.i = icmp eq i64 %indvars.iv.i, 5
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %17 = trunc i64 %indvars.iv.next.i to i32
  %spec.select.i = select i1 %cmp31.i, i32 14, i32 %17
  %indvars.iv.tr.i = trunc i64 %indvars.iv.i to i32
  %18 = shl i32 %indvars.iv.tr.i, 3
  %sub55.i = sub i32 %18, %spec.select
  call fastcc void @emit_stx(i8** nonnull %prog, i32 %bpf_size.0.i, i32 10, i32 %spec.select.i, i32 %sub55.i) #13
  %cmp1.i = icmp ult i64 %indvars.iv.next.i, %11
  br i1 %cmp1.i, label %if.end29.i.for.body.i_crit_edge, label %if.end29.i.save_regs.exit_crit_edge

if.end29.i.save_regs.exit_crit_edge:              ; preds = %if.end29.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %save_regs.exit

if.end29.i.for.body.i_crit_edge:                  ; preds = %if.end29.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.body.i

save_regs.exit:                                   ; preds = %if.end29.i.save_regs.exit_crit_edge, %if.end10.save_regs.exit_crit_edge
  %nr_progs = getelementptr inbounds %struct.bpf_tramp_progs, %struct.bpf_tramp_progs* %tprogs, i64 0, i32 1
  %19 = ptrtoint i32* %nr_progs to i64
  call void @__asan_load4_noabort(i64 %19)
  %20 = load i32, i32* %nr_progs, align 8
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %20)
  %tobool38 = icmp eq i32 %20, 0
  br i1 %tobool38, label %save_regs.exit.if.end44_crit_edge, label %if.then39

save_regs.exit.if.end44_crit_edge:                ; preds = %save_regs.exit
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end44

if.then39:                                        ; preds = %save_regs.exit
  %21 = bitcast i8** %prog.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %21) #15
  %22 = bitcast i8** %prog to i64*
  %23 = ptrtoint i64* %22 to i64
  call void @__asan_load8_noabort(i64 %23)
  %24 = load i64, i64* %22, align 8
  %25 = bitcast i8** %prog.i to i64*
  %26 = ptrtoint i64* %25 to i64
  call void @__asan_store8_noabort(i64 %26)
  store i64 %24, i64* %25, align 8
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %20)
  %cmp1.i233 = icmp sgt i32 %20, 0
  br i1 %cmp1.i233, label %if.then39.for.body.i238_crit_edge, label %if.then39.invoke_bpf.exit.thread_crit_edge

if.then39.invoke_bpf.exit.thread_crit_edge:       ; preds = %if.then39
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %invoke_bpf.exit.thread

if.then39.for.body.i238_crit_edge:                ; preds = %if.then39
  br label %for.body.i238

for.cond.i:                                       ; preds = %for.body.i238
  %27 = ptrtoint i32* %nr_progs to i64
  call void @__asan_load4_noabort(i64 %27)
  %28 = load i32, i32* %nr_progs, align 8
  %29 = sext i32 %28 to i64
  %cmp.i234 = icmp slt i64 %indvars.iv.next.i237, %29
  br i1 %cmp.i234, label %for.cond.i.for.body.i238_crit_edge, label %for.cond.i.invoke_bpf.exit.thread_crit_edge

for.cond.i.invoke_bpf.exit.thread_crit_edge:      ; preds = %for.cond.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %invoke_bpf.exit.thread

for.cond.i.for.body.i238_crit_edge:               ; preds = %for.cond.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.body.i238

for.body.i238:                                    ; preds = %for.cond.i.for.body.i238_crit_edge, %if.then39.for.body.i238_crit_edge
  %indvars.iv.i235 = phi i64 [ %indvars.iv.next.i237, %for.cond.i.for.body.i238_crit_edge ], [ 0, %if.then39.for.body.i238_crit_edge ]
  %arrayidx.i236 = getelementptr %struct.bpf_tramp_progs, %struct.bpf_tramp_progs* %tprogs, i64 0, i32 0, i64 %indvars.iv.i235
  %30 = ptrtoint %struct.bpf_prog** %arrayidx.i236 to i64
  call void @__asan_load8_noabort(i64 %30)
  %31 = load %struct.bpf_prog*, %struct.bpf_prog** %arrayidx.i236, align 8
  %call.i = call fastcc i32 @invoke_bpf_prog(i8** nonnull %prog.i, %struct.bpf_prog* %31, i32 %spec.select, i1 zeroext false) #13
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %call.i)
  %tobool.i = icmp eq i32 %call.i, 0
  %indvars.iv.next.i237 = add nuw nsw i64 %indvars.iv.i235, 1
  br i1 %tobool.i, label %for.cond.i, label %invoke_bpf.exit

invoke_bpf.exit.thread:                           ; preds = %for.cond.i.invoke_bpf.exit.thread_crit_edge, %if.then39.invoke_bpf.exit.thread_crit_edge
  %32 = ptrtoint i64* %25 to i64
  call void @__asan_load8_noabort(i64 %32)
  %33 = load i64, i64* %25, align 8
  %34 = ptrtoint i64* %22 to i64
  call void @__asan_store8_noabort(i64 %34)
  store i64 %33, i64* %22, align 8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %21) #15
  br label %if.end44

invoke_bpf.exit:                                  ; preds = %for.body.i238
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %21) #15
  br label %cleanup158

if.end44:                                         ; preds = %save_regs.exit.if.end44_crit_edge, %invoke_bpf.exit.thread
  %nr_progs45 = getelementptr %struct.bpf_tramp_progs, %struct.bpf_tramp_progs* %tprogs, i64 2, i32 1
  %35 = ptrtoint i32* %nr_progs45 to i64
  call void @__asan_load4_noabort(i64 %35)
  %36 = load i32, i32* %nr_progs45, align 8
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %36)
  %tobool46 = icmp eq i32 %36, 0
  br i1 %tobool46, label %if.end44.if.end58_crit_edge, label %if.then47

if.end44.if.end58_crit_edge:                      ; preds = %if.end44
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end58

if.then47:                                        ; preds = %if.end44
  %conv49 = sext i32 %36 to i64
  %call.i239 = tail call fastcc i8* @kmalloc_array(i64 %conv49, i64 8, i32 3520) #13
  %37 = bitcast i8* %call.i239 to i8**
  %tobool51 = icmp eq i8* %call.i239, null
  br i1 %tobool51, label %if.then47.cleanup158_crit_edge, label %if.end53

if.then47.cleanup158_crit_edge:                   ; preds = %if.then47
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %cleanup158

if.end53:                                         ; preds = %if.then47
  %38 = bitcast i8** %prog.i240 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %38) #15
  %39 = bitcast i8** %prog to i64*
  %40 = ptrtoint i64* %39 to i64
  call void @__asan_load8_noabort(i64 %40)
  %41 = load i64, i64* %39, align 8
  %42 = bitcast i8** %prog.i240 to i64*
  %.cast.i = inttoptr i64 %41 to i8*
  %43 = inttoptr i64 %41 to i16*
  %44 = ptrtoint i16* %43 to i64
  call void @__asan_store2_noabort(i64 %44)
  store i16 -16335, i16* %43, align 2
  %add.ptr.i102.i.i = getelementptr i8, i8* %.cast.i, i64 2
  %45 = bitcast i8* %add.ptr.i102.i.i to i16*
  %46 = ptrtoint i16* %45 to i64
  call void @__asan_store2_noabort(i64 %46)
  store i16 -30392, i16* %45, align 2
  %add.ptr.i142.i.i = getelementptr i8, i8* %.cast.i, i64 4
  %47 = bitcast i8* %add.ptr.i142.i.i to i16*
  %48 = ptrtoint i16* %47 to i64
  call void @__asan_store2_noabort(i64 %48)
  store i16 -1979, i16* %47, align 2
  %add.ptr.i132.i.i = getelementptr i8, i8* %.cast.i, i64 6
  %49 = ptrtoint i8** %prog.i240 to i64
  call void @__asan_store8_noabort(i64 %49)
  store i8* %add.ptr.i132.i.i, i8** %prog.i240, align 8
  %50 = ptrtoint i32* %nr_progs45 to i64
  call void @__asan_load4_noabort(i64 %50)
  %51 = load i32, i32* %nr_progs45, align 8
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %51)
  %cmp2.i = icmp sgt i32 %51, 0
  br i1 %cmp2.i, label %if.end53.for.body.i246_crit_edge, label %if.end53.invoke_bpf_mod_ret.exit.thread_crit_edge

if.end53.invoke_bpf_mod_ret.exit.thread_crit_edge: ; preds = %if.end53
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %invoke_bpf_mod_ret.exit.thread

if.end53.for.body.i246_crit_edge:                 ; preds = %if.end53
  br label %for.body.i246

for.body.i246:                                    ; preds = %do.body.i.for.body.i246_crit_edge, %if.end53.for.body.i246_crit_edge
  %indvars.iv.i242 = phi i64 [ %indvars.iv.next.i247, %do.body.i.for.body.i246_crit_edge ], [ 0, %if.end53.for.body.i246_crit_edge ]
  %arrayidx.i243 = getelementptr %struct.bpf_tramp_progs, %struct.bpf_tramp_progs* %tprogs, i64 2, i32 0, i64 %indvars.iv.i242
  %52 = ptrtoint %struct.bpf_prog** %arrayidx.i243 to i64
  call void @__asan_load8_noabort(i64 %52)
  %53 = load %struct.bpf_prog*, %struct.bpf_prog** %arrayidx.i243, align 8
  %call.i244 = call fastcc i32 @invoke_bpf_prog(i8** nonnull %prog.i240, %struct.bpf_prog* %53, i32 %spec.select, i1 zeroext true) #13
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %call.i244)
  %tobool.i245 = icmp eq i32 %call.i244, 0
  br i1 %tobool.i245, label %do.body.i, label %invoke_bpf_mod_ret.exit

do.body.i:                                        ; preds = %for.body.i246
  %54 = ptrtoint i8** %prog.i240 to i64
  call void @__asan_load8_noabort(i64 %54)
  %55 = load i8*, i8** %prog.i240, align 8
  %56 = bitcast i8* %55 to i32*
  %57 = ptrtoint i32* %56 to i64
  call void @__asan_store4_noabort(i64 %57)
  store i32 -125992120, i32* %56, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i1.i = getelementptr i8, i8* %55, i64 4
  %58 = ptrtoint i8* %add.ptr.i1.i to i64
  call void @__asan_store1_noabort(i64 %58)
  store i8 0, i8* %add.ptr.i1.i, align 1
  %add.ptr.i.i = getelementptr i8, i8* %55, i64 5
  %arrayidx8.i = getelementptr i8*, i8** %37, i64 %indvars.iv.i242
  %59 = ptrtoint i8** %arrayidx8.i to i64
  call void @__asan_store8_noabort(i64 %59)
  store i8* %add.ptr.i.i, i8** %arrayidx8.i, align 8
  call void @__asan_load8_noabort(i64 ptrtoint (i8*** @ideal_nops to i64))
  %60 = load i8**, i8*** @ideal_nops, align 8
  %arrayidx.i.i = getelementptr i8*, i8** %60, i64 6
  %61 = ptrtoint i8** %arrayidx.i.i to i64
  call void @__asan_load8_noabort(i64 %61)
  %62 = load i8*, i8** %arrayidx.i.i, align 8
  %63 = ptrtoint i8* %62 to i64
  call void @__asan_load1_noabort(i64 %63)
  %64 = load i8, i8* %62, align 1
  %65 = ptrtoint i8* %add.ptr.i.i to i64
  call void @__asan_store1_noabort(i64 %65)
  store i8 %64, i8* %add.ptr.i.i, align 1
  %add.ptr.i.i.i = getelementptr i8, i8* %55, i64 6
  %66 = load i8**, i8*** @ideal_nops, align 8
  %arrayidx.i.i.1 = getelementptr i8*, i8** %66, i64 6
  %67 = ptrtoint i8** %arrayidx.i.i.1 to i64
  call void @__asan_load8_noabort(i64 %67)
  %68 = load i8*, i8** %arrayidx.i.i.1, align 8
  %arrayidx4.i.i.1 = getelementptr i8, i8* %68, i64 1
  %69 = ptrtoint i8* %arrayidx4.i.i.1 to i64
  call void @__asan_load1_noabort(i64 %69)
  %70 = load i8, i8* %arrayidx4.i.i.1, align 1
  %71 = ptrtoint i8* %add.ptr.i.i.i to i64
  call void @__asan_store1_noabort(i64 %71)
  store i8 %70, i8* %add.ptr.i.i.i, align 1
  %add.ptr.i.i.i.1 = getelementptr i8, i8* %55, i64 7
  %72 = load i8**, i8*** @ideal_nops, align 8
  %arrayidx.i.i.2 = getelementptr i8*, i8** %72, i64 6
  %73 = ptrtoint i8** %arrayidx.i.i.2 to i64
  call void @__asan_load8_noabort(i64 %73)
  %74 = load i8*, i8** %arrayidx.i.i.2, align 8
  %arrayidx4.i.i.2 = getelementptr i8, i8* %74, i64 2
  %75 = ptrtoint i8* %arrayidx4.i.i.2 to i64
  call void @__asan_load1_noabort(i64 %75)
  %76 = load i8, i8* %arrayidx4.i.i.2, align 1
  %77 = ptrtoint i8* %add.ptr.i.i.i.1 to i64
  call void @__asan_store1_noabort(i64 %77)
  store i8 %76, i8* %add.ptr.i.i.i.1, align 1
  %add.ptr.i.i.i.2 = getelementptr i8, i8* %55, i64 8
  %78 = load i8**, i8*** @ideal_nops, align 8
  %arrayidx.i.i.3 = getelementptr i8*, i8** %78, i64 6
  %79 = ptrtoint i8** %arrayidx.i.i.3 to i64
  call void @__asan_load8_noabort(i64 %79)
  %80 = load i8*, i8** %arrayidx.i.i.3, align 8
  %arrayidx4.i.i.3 = getelementptr i8, i8* %80, i64 3
  %81 = ptrtoint i8* %arrayidx4.i.i.3 to i64
  call void @__asan_load1_noabort(i64 %81)
  %82 = load i8, i8* %arrayidx4.i.i.3, align 1
  %83 = ptrtoint i8* %add.ptr.i.i.i.2 to i64
  call void @__asan_store1_noabort(i64 %83)
  store i8 %82, i8* %add.ptr.i.i.i.2, align 1
  %add.ptr.i.i.i.3 = getelementptr i8, i8* %55, i64 9
  %84 = load i8**, i8*** @ideal_nops, align 8
  %arrayidx.i.i.4 = getelementptr i8*, i8** %84, i64 6
  %85 = ptrtoint i8** %arrayidx.i.i.4 to i64
  call void @__asan_load8_noabort(i64 %85)
  %86 = load i8*, i8** %arrayidx.i.i.4, align 8
  %arrayidx4.i.i.4 = getelementptr i8, i8* %86, i64 4
  %87 = ptrtoint i8* %arrayidx4.i.i.4 to i64
  call void @__asan_load1_noabort(i64 %87)
  %88 = load i8, i8* %arrayidx4.i.i.4, align 1
  %89 = ptrtoint i8* %add.ptr.i.i.i.3 to i64
  call void @__asan_store1_noabort(i64 %89)
  store i8 %88, i8* %add.ptr.i.i.i.3, align 1
  %add.ptr.i.i.i.4 = getelementptr i8, i8* %55, i64 10
  %90 = load i8**, i8*** @ideal_nops, align 8
  %arrayidx.i.i.5 = getelementptr i8*, i8** %90, i64 6
  %91 = ptrtoint i8** %arrayidx.i.i.5 to i64
  call void @__asan_load8_noabort(i64 %91)
  %92 = load i8*, i8** %arrayidx.i.i.5, align 8
  %arrayidx4.i.i.5 = getelementptr i8, i8* %92, i64 5
  %93 = ptrtoint i8* %arrayidx4.i.i.5 to i64
  call void @__asan_load1_noabort(i64 %93)
  %94 = load i8, i8* %arrayidx4.i.i.5, align 1
  %95 = ptrtoint i8* %add.ptr.i.i.i.4 to i64
  call void @__asan_store1_noabort(i64 %95)
  store i8 %94, i8* %add.ptr.i.i.i.4, align 1
  %add.ptr.i.i.i.5 = getelementptr i8, i8* %55, i64 11
  %96 = ptrtoint i8** %prog.i240 to i64
  call void @__asan_store8_noabort(i64 %96)
  store i8* %add.ptr.i.i.i.5, i8** %prog.i240, align 8
  %indvars.iv.next.i247 = add nuw nsw i64 %indvars.iv.i242, 1
  %97 = ptrtoint i32* %nr_progs45 to i64
  call void @__asan_load4_noabort(i64 %97)
  %98 = load i32, i32* %nr_progs45, align 8
  %99 = sext i32 %98 to i64
  %cmp.i248 = icmp slt i64 %indvars.iv.next.i247, %99
  br i1 %cmp.i248, label %do.body.i.for.body.i246_crit_edge, label %do.body.i.invoke_bpf_mod_ret.exit.thread_crit_edge

do.body.i.invoke_bpf_mod_ret.exit.thread_crit_edge: ; preds = %do.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %invoke_bpf_mod_ret.exit.thread

do.body.i.for.body.i246_crit_edge:                ; preds = %do.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.body.i246

invoke_bpf_mod_ret.exit.thread:                   ; preds = %do.body.i.invoke_bpf_mod_ret.exit.thread_crit_edge, %if.end53.invoke_bpf_mod_ret.exit.thread_crit_edge
  %100 = ptrtoint i64* %42 to i64
  call void @__asan_load8_noabort(i64 %100)
  %101 = load i64, i64* %42, align 8
  %102 = ptrtoint i64* %39 to i64
  call void @__asan_store8_noabort(i64 %102)
  store i64 %101, i64* %39, align 8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %38) #15
  br label %if.end58

invoke_bpf_mod_ret.exit:                          ; preds = %for.body.i246
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %38) #15
  br label %cleanup

if.end58:                                         ; preds = %if.end44.if.end58_crit_edge, %invoke_bpf_mod_ret.exit.thread
  %branches.0 = phi i8** [ null, %if.end44.if.end58_crit_edge ], [ %37, %invoke_bpf_mod_ret.exit.thread ]
  br i1 %tobool13, label %if.then62, label %if.end58.if.end73_crit_edge

if.end58.if.end73_crit_edge:                      ; preds = %if.end58
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end73

if.then62:                                        ; preds = %if.end58
  %103 = ptrtoint i32* %nr_progs to i64
  call void @__asan_load4_noabort(i64 %103)
  %104 = load i32, i32* %nr_progs, align 8
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %104)
  %tobool64 = icmp eq i32 %104, 0
  br i1 %tobool64, label %lor.lhs.false, label %if.then67

lor.lhs.false:                                    ; preds = %if.then62
  %105 = ptrtoint i32* %nr_progs45 to i64
  call void @__asan_load4_noabort(i64 %105)
  %106 = load i32, i32* %nr_progs45, align 8
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %106)
  %tobool66 = icmp eq i32 %106, 0
  %cmp156.i.not = xor i1 %cmp156.i, true
  %brmerge = or i1 %tobool66, %cmp156.i.not
  br i1 %brmerge, label %lor.lhs.false.if.end68_crit_edge, label %lor.lhs.false.for.body.preheader.i254_crit_edge

lor.lhs.false.for.body.preheader.i254_crit_edge:  ; preds = %lor.lhs.false
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.body.preheader.i254

lor.lhs.false.if.end68_crit_edge:                 ; preds = %lor.lhs.false
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end68

if.then67:                                        ; preds = %if.then62
  br i1 %cmp156.i, label %if.then67.for.body.preheader.i254_crit_edge, label %if.then67.if.end68_crit_edge

if.then67.if.end68_crit_edge:                     ; preds = %if.then67
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end68

if.then67.for.body.preheader.i254_crit_edge:      ; preds = %if.then67
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.body.preheader.i254

for.body.preheader.i254:                          ; preds = %if.then67.for.body.preheader.i254_crit_edge, %lor.lhs.false.for.body.preheader.i254_crit_edge
  call void @__sanitizer_cov_trace_const_cmp4(i32 6, i32 %conv)
  %cmp.i252 = icmp ult i32 %conv, 6
  %nr_args..i253 = select i1 %cmp.i252, i32 %conv, i32 6
  %107 = zext i32 %nr_args..i253 to i64
  br label %for.body.i257

for.body.i257:                                    ; preds = %if.end29.i269.for.body.i257_crit_edge, %for.body.preheader.i254
  %indvars.iv.i255 = phi i64 [ 0, %for.body.preheader.i254 ], [ %indvars.iv.next.i264, %if.end29.i269.for.body.i257_crit_edge ]
  %arrayidx.i256 = getelementptr %struct.btf_func_model, %struct.btf_func_model* %m, i64 0, i32 2, i64 %indvars.iv.i255
  %108 = ptrtoint i8* %arrayidx.i256 to i64
  call void @__asan_load1_noabort(i64 %108)
  %109 = load i8, i8* %arrayidx.i256, align 1
  %switch.tableidx343 = add i8 %109, -1
  call void @__sanitizer_cov_trace_const_cmp1(i8 8, i8 %switch.tableidx343)
  %110 = icmp ult i8 %switch.tableidx343, 8
  br i1 %110, label %switch.lookup342, label %for.body.i257.if.end29.i269_crit_edge

for.body.i257.if.end29.i269_crit_edge:            ; preds = %for.body.i257
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end29.i269

switch.lookup342:                                 ; preds = %for.body.i257
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %111 = sext i8 %switch.tableidx343 to i64
  %switch.gep344 = getelementptr inbounds [8 x i32], [8 x i32]* @switch.table.arch_prepare_bpf_trampoline.19, i64 0, i64 %111
  %112 = ptrtoint i32* %switch.gep344 to i64
  call void @__asan_load4_noabort(i64 %112)
  %switch.load345 = load i32, i32* %switch.gep344, align 4
  br label %if.end29.i269

if.end29.i269:                                    ; preds = %for.body.i257.if.end29.i269_crit_edge, %switch.lookup342
  %bpf_size.0.i262 = phi i32 [ %switch.load345, %switch.lookup342 ], [ -22, %for.body.i257.if.end29.i269_crit_edge ]
  call void @__sanitizer_cov_trace_const_cmp8(i64 5, i64 %indvars.iv.i255)
  %cmp31.i263 = icmp eq i64 %indvars.iv.i255, 5
  %indvars.iv.next.i264 = add nuw nsw i64 %indvars.iv.i255, 1
  %113 = trunc i64 %indvars.iv.next.i264 to i32
  %spec.select.i265 = select i1 %cmp31.i263, i32 14, i32 %113
  %indvars.iv.tr.i266 = trunc i64 %indvars.iv.i255 to i32
  %114 = shl i32 %indvars.iv.tr.i266, 3
  %sub55.i267 = sub i32 %114, %spec.select
  call fastcc void @emit_ldx(i8** nonnull %prog, i32 %bpf_size.0.i262, i32 %spec.select.i265, i32 10, i32 %sub55.i267) #13
  %cmp1.i268 = icmp ult i64 %indvars.iv.next.i264, %107
  br i1 %cmp1.i268, label %if.end29.i269.for.body.i257_crit_edge, label %if.end29.i269.if.end68_crit_edge

if.end29.i269.if.end68_crit_edge:                 ; preds = %if.end29.i269
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end68

if.end29.i269.for.body.i257_crit_edge:            ; preds = %if.end29.i269
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.body.i257

if.end68:                                         ; preds = %if.end29.i269.if.end68_crit_edge, %if.then67.if.end68_crit_edge, %lor.lhs.false.if.end68_crit_edge
  %115 = ptrtoint i8** %prog to i64
  call void @__asan_load8_noabort(i64 %115)
  %116 = load i8*, i8** %prog, align 8
  %add.ptr.i.i271 = getelementptr i8, i8* %116, i64 5
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %orig_call.addr.0 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %add.ptr.i.i271 to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %117 = add i64 %sub.ptr.sub.i.i, 2147483648
  call void @__sanitizer_cov_trace_const_cmp8(i64 4294967296, i64 %117)
  %118 = icmp ult i64 %117, 4294967296
  br i1 %118, label %if.end72, label %emit_call.exit

emit_call.exit:                                   ; preds = %if.end68
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %call1.i.i = tail call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.2, i64 0, i64 0), i8* %orig_call.addr.0) #16
  br label %cleanup

if.end72:                                         ; preds = %if.end68
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %119 = ptrtoint i8* %116 to i64
  call void @__asan_store1_noabort(i64 %119)
  store i8 -24, i8* %116, align 1
  %add.ptr.i23.i.i = getelementptr i8, i8* %116, i64 1
  %conv5.i.i = trunc i64 %sub.ptr.sub.i.i to i32
  %120 = bitcast i8* %add.ptr.i23.i.i to i32*
  %121 = ptrtoint i32* %120 to i64
  call void @__asan_store4_noabort(i64 %121)
  store i32 %conv5.i.i, i32* %120, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %122 = bitcast i8* %add.ptr.i.i271 to i16*
  %123 = ptrtoint i16* %122 to i64
  call void @__asan_store2_noabort(i64 %123)
  store i16 -30392, i16* %122, align 2
  %add.ptr.i142.i = getelementptr i8, i8* %116, i64 7
  %124 = bitcast i8* %add.ptr.i142.i to i16*
  %125 = ptrtoint i16* %124 to i64
  call void @__asan_store2_noabort(i64 %125)
  store i16 -1979, i16* %124, align 2
  %add.ptr.i132.i = getelementptr i8, i8* %116, i64 9
  %126 = ptrtoint i8** %prog to i64
  call void @__asan_store8_noabort(i64 %126)
  store i8* %add.ptr.i132.i, i8** %prog, align 8
  br label %if.end73

if.end73:                                         ; preds = %if.end58.if.end73_crit_edge, %if.end72
  %127 = ptrtoint i32* %nr_progs45 to i64
  call void @__asan_load4_noabort(i64 %127)
  %128 = load i32, i32* %nr_progs45, align 8
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %128)
  %tobool75 = icmp eq i32 %128, 0
  br i1 %tobool75, label %if.end73.if.end84_crit_edge, label %if.then76

if.end73.if.end84_crit_edge:                      ; preds = %if.end73
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end84

if.then76:                                        ; preds = %if.end73
  %129 = ptrtoint i8** %prog to i64
  call void @__asan_load8_noabort(i64 %129)
  %130 = load i8*, i8** %prog, align 8
  %131 = ptrtoint i8* %130 to i64
  %add.i = add i64 %131, 15
  %and.i = and i64 %add.i, -16
  %132 = inttoptr i64 %and.i to i8*
  %cmp.i273 = icmp eq i8* %130, %132
  br i1 %cmp.i273, label %if.then76.emit_align.exit_crit_edge, label %if.then.i

if.then76.emit_align.exit_crit_edge:              ; preds = %if.then76
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit_align.exit

if.then.i:                                        ; preds = %if.then76
  %sub.ptr.sub.i = sub i64 %and.i, %131
  %conv4.i = trunc i64 %sub.ptr.sub.i to i32
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %conv4.i)
  %cmp21.i.i = icmp eq i32 %conv4.i, 0
  br i1 %cmp21.i.i, label %if.then.i.emit_align.exit_crit_edge, label %if.then.i.while.body.i.i_crit_edge

if.then.i.while.body.i.i_crit_edge:               ; preds = %if.then.i
  br label %while.body.i.i

if.then.i.emit_align.exit_crit_edge:              ; preds = %if.then.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit_align.exit

while.body.i.i:                                   ; preds = %for.end.i.i282.while.body.i.i_crit_edge, %if.then.i.while.body.i.i_crit_edge
  %prog.023.i.i = phi i8* [ %add.ptr.i.i.i278.lcssa, %for.end.i.i282.while.body.i.i_crit_edge ], [ %130, %if.then.i.while.body.i.i_crit_edge ]
  %len.addr.022.i.i = phi i32 [ %sub.i.i, %for.end.i.i282.while.body.i.i_crit_edge ], [ %conv4.i, %if.then.i.while.body.i.i_crit_edge ]
  call void @__sanitizer_cov_trace_const_cmp4(i32 8, i32 %len.addr.022.i.i)
  %133 = icmp ult i32 %len.addr.022.i.i, 8
  %spec.store.select.i.i = select i1 %133, i32 %len.addr.022.i.i, i32 8
  %idxprom.i.i = zext i32 %spec.store.select.i.i to i64
  call void @__asan_load8_noabort(i64 ptrtoint (i8*** @ideal_nops to i64))
  %134 = load i8**, i8*** @ideal_nops, align 8
  %arrayidx.i.i276 = getelementptr i8*, i8** %134, i64 %idxprom.i.i
  %135 = ptrtoint i8** %arrayidx.i.i276 to i64
  call void @__asan_load8_noabort(i64 %135)
  %136 = load i8*, i8** %arrayidx.i.i276, align 8
  %137 = ptrtoint i8* %136 to i64
  call void @__asan_load1_noabort(i64 %137)
  %138 = load i8, i8* %136, align 1
  %139 = ptrtoint i8* %prog.023.i.i to i64
  call void @__asan_store1_noabort(i64 %139)
  store i8 %138, i8* %prog.023.i.i, align 1
  %add.ptr.i.i.i278 = getelementptr i8, i8* %prog.023.i.i, i64 1
  call void @__sanitizer_cov_trace_const_cmp4(i32 1, i32 %spec.store.select.i.i)
  %cmp2.i.i280 = icmp ugt i32 %spec.store.select.i.i, 1
  br i1 %cmp2.i.i280, label %do.body.i.i281.1, label %while.body.i.i.for.end.i.i282_crit_edge

while.body.i.i.for.end.i.i282_crit_edge:          ; preds = %while.body.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.end.i.i282

for.end.i.i282:                                   ; preds = %do.body.i.i281.6.for.end.i.i282_crit_edge, %do.body.i.i281.5.for.end.i.i282_crit_edge, %do.body.i.i281.4.for.end.i.i282_crit_edge, %do.body.i.i281.3.for.end.i.i282_crit_edge, %do.body.i.i281.2.for.end.i.i282_crit_edge, %do.body.i.i281.1.for.end.i.i282_crit_edge, %while.body.i.i.for.end.i.i282_crit_edge, %do.body.i.i281.7
  %add.ptr.i.i.i278.lcssa = phi i8* [ %add.ptr.i.i.i278, %while.body.i.i.for.end.i.i282_crit_edge ], [ %add.ptr.i.i.i278.1, %do.body.i.i281.1.for.end.i.i282_crit_edge ], [ %add.ptr.i.i.i278.2, %do.body.i.i281.2.for.end.i.i282_crit_edge ], [ %add.ptr.i.i.i278.3, %do.body.i.i281.3.for.end.i.i282_crit_edge ], [ %add.ptr.i.i.i278.4, %do.body.i.i281.4.for.end.i.i282_crit_edge ], [ %add.ptr.i.i.i278.5, %do.body.i.i281.5.for.end.i.i282_crit_edge ], [ %add.ptr.i.i.i278.6, %do.body.i.i281.6.for.end.i.i282_crit_edge ], [ %add.ptr.i.i.i278.7, %do.body.i.i281.7 ]
  %sub.i.i = sub i32 %len.addr.022.i.i, %spec.store.select.i.i
  %cmp.i.i = icmp eq i32 %sub.i.i, 0
  br i1 %cmp.i.i, label %emit_nops.exit.loopexit.i, label %for.end.i.i282.while.body.i.i_crit_edge

for.end.i.i282.while.body.i.i_crit_edge:          ; preds = %for.end.i.i282
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %while.body.i.i

emit_nops.exit.loopexit.i:                        ; preds = %for.end.i.i282
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %.pre.i = ptrtoint i8* %add.ptr.i.i.i278.lcssa to i64
  br label %emit_align.exit

emit_align.exit:                                  ; preds = %if.then.i.emit_align.exit_crit_edge, %if.then76.emit_align.exit_crit_edge, %emit_nops.exit.loopexit.i
  %prog.sroa.0.0.i = phi i64 [ %131, %if.then76.emit_align.exit_crit_edge ], [ %.pre.i, %emit_nops.exit.loopexit.i ], [ %131, %if.then.i.emit_align.exit_crit_edge ]
  %140 = bitcast i8** %prog to i64*
  %141 = ptrtoint i64* %140 to i64
  call void @__asan_store8_noabort(i64 %141)
  store i64 %prog.sroa.0.0.i, i64* %140, align 8
  %142 = ptrtoint i32* %nr_progs45 to i64
  call void @__asan_load4_noabort(i64 %142)
  %143 = load i32, i32* %nr_progs45, align 8
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %143)
  %cmp78340 = icmp sgt i32 %143, 0
  br i1 %cmp78340, label %emit_align.exit.for.body_crit_edge, label %emit_align.exit.if.end84_crit_edge

emit_align.exit.if.end84_crit_edge:               ; preds = %emit_align.exit
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end84

emit_align.exit.for.body_crit_edge:               ; preds = %emit_align.exit
  br label %for.body

for.body:                                         ; preds = %emit_cond_near_jump.exit.for.body_crit_edge, %emit_align.exit.for.body_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %emit_cond_near_jump.exit.for.body_crit_edge ], [ 0, %emit_align.exit.for.body_crit_edge ]
  %arrayidx80 = getelementptr i8*, i8** %branches.0, i64 %indvars.iv
  %144 = ptrtoint i8** %prog to i64
  call void @__asan_load8_noabort(i64 %144)
  %145 = load i8*, i8** %prog, align 8
  %146 = ptrtoint i8** %arrayidx80 to i64
  call void @__asan_load8_noabort(i64 %146)
  %147 = load i8*, i8** %arrayidx80, align 8
  %add.ptr1.i = getelementptr i8, i8* %147, i64 6
  %sub.ptr.lhs.cast.i = ptrtoint i8* %145 to i64
  %sub.ptr.rhs.cast.i = ptrtoint i8* %add.ptr1.i to i64
  %sub.ptr.sub.i283 = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %148 = add i64 %sub.ptr.sub.i283, 2147483648
  call void @__sanitizer_cov_trace_const_cmp8(i64 4294967296, i64 %148)
  %149 = icmp ult i64 %148, 4294967296
  br i1 %149, label %do.body3.i, label %if.then.i284

if.then.i284:                                     ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %call2.i = tail call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.3, i64 0, i64 0), i8* %145) #16
  br label %emit_cond_near_jump.exit

do.body3.i:                                       ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %150 = bitcast i8* %147 to i16*
  %151 = ptrtoint i16* %150 to i64
  call void @__asan_store2_noabort(i64 %151)
  store i16 -31473, i16* %150, align 2
  %add.ptr.i26.i = getelementptr i8, i8* %147, i64 2
  %conv8.i = trunc i64 %sub.ptr.sub.i283 to i32
  %152 = bitcast i8* %add.ptr.i26.i to i32*
  %153 = ptrtoint i32* %152 to i64
  call void @__asan_store4_noabort(i64 %153)
  store i32 %conv8.i, i32* %152, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %154 = ptrtoint i8** %arrayidx80 to i64
  call void @__asan_store8_noabort(i64 %154)
  store i8* %add.ptr1.i, i8** %arrayidx80, align 8
  br label %emit_cond_near_jump.exit

emit_cond_near_jump.exit:                         ; preds = %if.then.i284, %do.body3.i
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %155 = ptrtoint i32* %nr_progs45 to i64
  call void @__asan_load4_noabort(i64 %155)
  %156 = load i32, i32* %nr_progs45, align 8
  %157 = sext i32 %156 to i64
  %cmp78 = icmp slt i64 %indvars.iv.next, %157
  br i1 %cmp78, label %emit_cond_near_jump.exit.for.body_crit_edge, label %emit_cond_near_jump.exit.if.end84_crit_edge

emit_cond_near_jump.exit.if.end84_crit_edge:      ; preds = %emit_cond_near_jump.exit
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end84

emit_cond_near_jump.exit.for.body_crit_edge:      ; preds = %emit_cond_near_jump.exit
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.body

if.end84:                                         ; preds = %emit_cond_near_jump.exit.if.end84_crit_edge, %emit_align.exit.if.end84_crit_edge, %if.end73.if.end84_crit_edge
  %nr_progs85 = getelementptr %struct.bpf_tramp_progs, %struct.bpf_tramp_progs* %tprogs, i64 1, i32 1
  %158 = ptrtoint i32* %nr_progs85 to i64
  call void @__asan_load4_noabort(i64 %158)
  %159 = load i32, i32* %nr_progs85, align 8
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %159)
  %tobool86 = icmp eq i32 %159, 0
  br i1 %tobool86, label %if.end84.if.end92_crit_edge, label %if.then87

if.end84.if.end92_crit_edge:                      ; preds = %if.end84
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end92

if.then87:                                        ; preds = %if.end84
  %160 = bitcast i8** %prog.i287 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %160) #15
  %161 = bitcast i8** %prog to i64*
  %162 = ptrtoint i64* %161 to i64
  call void @__asan_load8_noabort(i64 %162)
  %163 = load i64, i64* %161, align 8
  %164 = bitcast i8** %prog.i287 to i64*
  %165 = ptrtoint i64* %164 to i64
  call void @__asan_store8_noabort(i64 %165)
  store i64 %163, i64* %164, align 8
  %166 = ptrtoint i32* %nr_progs85 to i64
  call void @__asan_load4_noabort(i64 %166)
  %167 = load i32, i32* %nr_progs85, align 8
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %167)
  %cmp1.i289 = icmp sgt i32 %167, 0
  br i1 %cmp1.i289, label %if.then87.for.body.i297_crit_edge, label %if.then87.invoke_bpf.exit300.thread_crit_edge

if.then87.invoke_bpf.exit300.thread_crit_edge:    ; preds = %if.then87
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %invoke_bpf.exit300.thread

if.then87.for.body.i297_crit_edge:                ; preds = %if.then87
  br label %for.body.i297

for.cond.i291:                                    ; preds = %for.body.i297
  %168 = ptrtoint i32* %nr_progs85 to i64
  call void @__asan_load4_noabort(i64 %168)
  %169 = load i32, i32* %nr_progs85, align 8
  %170 = sext i32 %169 to i64
  %cmp.i290 = icmp slt i64 %indvars.iv.next.i296, %170
  br i1 %cmp.i290, label %for.cond.i291.for.body.i297_crit_edge, label %for.cond.i291.invoke_bpf.exit300.thread_crit_edge

for.cond.i291.invoke_bpf.exit300.thread_crit_edge: ; preds = %for.cond.i291
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %invoke_bpf.exit300.thread

for.cond.i291.for.body.i297_crit_edge:            ; preds = %for.cond.i291
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.body.i297

for.body.i297:                                    ; preds = %for.cond.i291.for.body.i297_crit_edge, %if.then87.for.body.i297_crit_edge
  %indvars.iv.i292 = phi i64 [ %indvars.iv.next.i296, %for.cond.i291.for.body.i297_crit_edge ], [ 0, %if.then87.for.body.i297_crit_edge ]
  %arrayidx.i293 = getelementptr %struct.bpf_tramp_progs, %struct.bpf_tramp_progs* %tprogs, i64 1, i32 0, i64 %indvars.iv.i292
  %171 = ptrtoint %struct.bpf_prog** %arrayidx.i293 to i64
  call void @__asan_load8_noabort(i64 %171)
  %172 = load %struct.bpf_prog*, %struct.bpf_prog** %arrayidx.i293, align 8
  %call.i294 = call fastcc i32 @invoke_bpf_prog(i8** nonnull %prog.i287, %struct.bpf_prog* %172, i32 %spec.select, i1 zeroext false) #13
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %call.i294)
  %tobool.i295 = icmp eq i32 %call.i294, 0
  %indvars.iv.next.i296 = add nuw nsw i64 %indvars.iv.i292, 1
  br i1 %tobool.i295, label %for.cond.i291, label %invoke_bpf.exit300

invoke_bpf.exit300.thread:                        ; preds = %for.cond.i291.invoke_bpf.exit300.thread_crit_edge, %if.then87.invoke_bpf.exit300.thread_crit_edge
  %173 = ptrtoint i64* %164 to i64
  call void @__asan_load8_noabort(i64 %173)
  %174 = load i64, i64* %164, align 8
  %175 = ptrtoint i64* %161 to i64
  call void @__asan_store8_noabort(i64 %175)
  store i64 %174, i64* %161, align 8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %160) #15
  br label %if.end92

invoke_bpf.exit300:                               ; preds = %for.body.i297
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %160) #15
  br label %cleanup

if.end92:                                         ; preds = %if.end84.if.end92_crit_edge, %invoke_bpf.exit300.thread
  %brmerge339.demorgan = and i1 %tobool, %cmp156.i
  br i1 %brmerge339.demorgan, label %for.body.preheader.i304, label %if.end92.if.end97_crit_edge

if.end92.if.end97_crit_edge:                      ; preds = %if.end92
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end97

for.body.preheader.i304:                          ; preds = %if.end92
  call void @__sanitizer_cov_trace_const_cmp4(i32 6, i32 %conv)
  %cmp.i302 = icmp ult i32 %conv, 6
  %nr_args..i303 = select i1 %cmp.i302, i32 %conv, i32 6
  %176 = zext i32 %nr_args..i303 to i64
  br label %for.body.i307

for.body.i307:                                    ; preds = %if.end29.i319.for.body.i307_crit_edge, %for.body.preheader.i304
  %indvars.iv.i305 = phi i64 [ 0, %for.body.preheader.i304 ], [ %indvars.iv.next.i314, %if.end29.i319.for.body.i307_crit_edge ]
  %arrayidx.i306 = getelementptr %struct.btf_func_model, %struct.btf_func_model* %m, i64 0, i32 2, i64 %indvars.iv.i305
  %177 = ptrtoint i8* %arrayidx.i306 to i64
  call void @__asan_load1_noabort(i64 %177)
  %178 = load i8, i8* %arrayidx.i306, align 1
  %switch.tableidx347 = add i8 %178, -1
  call void @__sanitizer_cov_trace_const_cmp1(i8 8, i8 %switch.tableidx347)
  %179 = icmp ult i8 %switch.tableidx347, 8
  br i1 %179, label %switch.lookup346, label %for.body.i307.if.end29.i319_crit_edge

for.body.i307.if.end29.i319_crit_edge:            ; preds = %for.body.i307
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end29.i319

switch.lookup346:                                 ; preds = %for.body.i307
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %180 = sext i8 %switch.tableidx347 to i64
  %switch.gep348 = getelementptr inbounds [8 x i32], [8 x i32]* @switch.table.arch_prepare_bpf_trampoline.19, i64 0, i64 %180
  %181 = ptrtoint i32* %switch.gep348 to i64
  call void @__asan_load4_noabort(i64 %181)
  %switch.load349 = load i32, i32* %switch.gep348, align 4
  br label %if.end29.i319

if.end29.i319:                                    ; preds = %for.body.i307.if.end29.i319_crit_edge, %switch.lookup346
  %bpf_size.0.i312 = phi i32 [ %switch.load349, %switch.lookup346 ], [ -22, %for.body.i307.if.end29.i319_crit_edge ]
  call void @__sanitizer_cov_trace_const_cmp8(i64 5, i64 %indvars.iv.i305)
  %cmp31.i313 = icmp eq i64 %indvars.iv.i305, 5
  %indvars.iv.next.i314 = add nuw nsw i64 %indvars.iv.i305, 1
  %182 = trunc i64 %indvars.iv.next.i314 to i32
  %spec.select.i315 = select i1 %cmp31.i313, i32 14, i32 %182
  %indvars.iv.tr.i316 = trunc i64 %indvars.iv.i305 to i32
  %183 = shl i32 %indvars.iv.tr.i316, 3
  %sub55.i317 = sub i32 %183, %spec.select
  call fastcc void @emit_ldx(i8** nonnull %prog, i32 %bpf_size.0.i312, i32 %spec.select.i315, i32 10, i32 %sub55.i317) #13
  %cmp1.i318 = icmp ult i64 %indvars.iv.next.i314, %176
  br i1 %cmp1.i318, label %if.end29.i319.for.body.i307_crit_edge, label %if.end29.i319.if.end97_crit_edge

if.end29.i319.if.end97_crit_edge:                 ; preds = %if.end29.i319
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end97

if.end29.i319.for.body.i307_crit_edge:            ; preds = %if.end29.i319
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.body.i307

if.end97:                                         ; preds = %if.end29.i319.if.end97_crit_edge, %if.end92.if.end97_crit_edge
  br i1 %tobool13, label %if.then101, label %if.end97.do.body103_crit_edge

if.end97.do.body103_crit_edge:                    ; preds = %if.end97
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body103

if.then101:                                       ; preds = %if.end97
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %184 = ptrtoint i8** %prog to i64
  call void @__asan_load8_noabort(i64 %184)
  %185 = load i8*, i8** %prog, align 8
  %186 = bitcast i8* %185 to i16*
  %187 = ptrtoint i16* %186 to i64
  call void @__asan_store2_noabort(i64 %187)
  store i16 -29880, i16* %186, align 2
  %add.ptr.i116.i = getelementptr i8, i8* %185, i64 2
  %188 = bitcast i8* %add.ptr.i116.i to i16*
  %189 = ptrtoint i16* %188 to i64
  call void @__asan_store2_noabort(i64 %189)
  store i16 -1979, i16* %188, align 2
  %add.ptr.i106.i = getelementptr i8, i8* %185, i64 4
  store i8* %add.ptr.i106.i, i8** %prog, align 8
  br label %do.body103

do.body103:                                       ; preds = %if.end97.do.body103_crit_edge, %if.then101
  %190 = ptrtoint i8** %prog to i64
  call void @__asan_load8_noabort(i64 %190)
  %191 = load i8*, i8** %prog, align 8
  %192 = ptrtoint i8* %191 to i64
  call void @__asan_store1_noabort(i64 %192)
  store i8 91, i8* %191, align 1
  %add.ptr.i323 = getelementptr i8, i8* %191, i64 1
  %193 = ptrtoint i8* %add.ptr.i323 to i64
  call void @__asan_store1_noabort(i64 %193)
  store i8 -55, i8* %add.ptr.i323, align 1
  %add.ptr.i325 = getelementptr i8, i8* %191, i64 2
  store i8* %add.ptr.i325, i8** %prog, align 8
  br i1 %tobool18, label %do.body117, label %do.body103.do.body123_crit_edge

do.body103.do.body123_crit_edge:                  ; preds = %do.body103
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body123

do.body117:                                       ; preds = %do.body103
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %194 = bitcast i8* %add.ptr.i325 to i32*
  %195 = ptrtoint i32* %194 to i64
  call void @__asan_store4_noabort(i64 %195)
  store i32 147096392, i32* %194, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i326 = getelementptr i8, i8* %191, i64 6
  %196 = ptrtoint i8** %prog to i64
  call void @__asan_store8_noabort(i64 %196)
  store i8* %add.ptr.i326, i8** %prog, align 8
  br label %do.body123

do.body123:                                       ; preds = %do.body103.do.body123_crit_edge, %do.body117
  %197 = ptrtoint i8** %prog to i64
  call void @__asan_load8_noabort(i64 %197)
  %198 = load i8*, i8** %prog, align 8
  %199 = ptrtoint i8* %198 to i64
  call void @__asan_store1_noabort(i64 %199)
  store i8 -61, i8* %198, align 1
  %add.ptr.i328 = getelementptr i8, i8* %198, i64 1
  store i8* %add.ptr.i328, i8** %prog, align 8
  %add.ptr128 = getelementptr i8, i8* %image_end, i64 -64
  %cmp129 = icmp ugt i8* %add.ptr.i328, %add.ptr128
  br i1 %cmp129, label %do.body140, label %if.end156, !prof !44, !misexpect !45

do.body140:                                       ; preds = %do.body123
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  tail call void asm sideeffect "${0:c}:\0A\09.pushsection .discard.instr_begin\0A\09.long ${0:c}b - .\0A\09.popsection\0A\09", "i,~{dirflag},~{fpsr},~{flags}"(i32 1310) #15, !srcloc !46
  tail call void asm sideeffect "1:\09.byte 0x0f, 0x0b\0A.pushsection __bug_table,\22aw\22\0A2:\09.long 1b - 2b\09# bug_entry::bug_addr\0A\09.long ${0:c} - 2b\09# bug_entry::file\0A\09.word ${1:c}\09# bug_entry::line\0A\09.word ${2:c}\09# bug_entry::flags\0A\09.org 2b+${3:c}\0A.popsection", "i,i,i,i,~{dirflag},~{fpsr},~{flags}"(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str, i64 0, i64 0), i32 1682, i32 2307, i64 12) #15, !srcloc !47
  tail call void asm sideeffect "${0:c}:\0A\09.pushsection .discard.reachable\0A\09.long ${0:c}b - .\0A\09.popsection\0A\09", "i,~{dirflag},~{fpsr},~{flags}"(i32 1311) #15, !srcloc !48
  tail call void asm sideeffect "${0:c}: nop\0A\09.pushsection .discard.instr_end\0A\09.long ${0:c}b - .\0A\09.popsection\0A\09", "i,~{dirflag},~{fpsr},~{flags}"(i32 1312) #15, !srcloc !49
  br label %cleanup

if.end156:                                        ; preds = %do.body123
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %200 = bitcast i8** %prog to i64*
  %201 = ptrtoint i64* %200 to i64
  call void @__asan_load8_noabort(i64 %201)
  %202 = load i64, i64* %200, align 8
  %sub.ptr.rhs.cast = ptrtoint i8* %image to i64
  %sub.ptr.sub = sub i64 %202, %sub.ptr.rhs.cast
  %conv157 = trunc i64 %sub.ptr.sub to i32
  br label %cleanup

cleanup:                                          ; preds = %invoke_bpf.exit300, %emit_call.exit, %invoke_bpf_mod_ret.exit, %do.body140, %if.end156
  %ret.0 = phi i32 [ %conv157, %if.end156 ], [ -22, %invoke_bpf_mod_ret.exit ], [ -22, %emit_call.exit ], [ -22, %invoke_bpf.exit300 ], [ -14, %do.body140 ]
  %branches.1 = phi i8** [ %branches.0, %if.end156 ], [ %37, %invoke_bpf_mod_ret.exit ], [ %branches.0, %emit_call.exit ], [ %branches.0, %invoke_bpf.exit300 ], [ %branches.0, %do.body140 ]
  %203 = bitcast i8** %branches.1 to i8*
  tail call void @kfree(i8* %203) #13
  br label %cleanup158

cleanup158:                                       ; preds = %if.then47.cleanup158_crit_edge, %if.end.cleanup158_crit_edge, %entry.cleanup158_crit_edge, %invoke_bpf.exit, %cleanup
  %retval.0 = phi i32 [ %ret.0, %cleanup ], [ -524, %entry.cleanup158_crit_edge ], [ -22, %if.end.cleanup158_crit_edge ], [ -22, %invoke_bpf.exit ], [ -12, %if.then47.cleanup158_crit_edge ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2) #15
  ret i32 %retval.0

do.body.i.i281.1:                                 ; preds = %while.body.i.i
  call void @__asan_load8_noabort(i64 ptrtoint (i8*** @ideal_nops to i64))
  %204 = load i8**, i8*** @ideal_nops, align 8
  %arrayidx.i.i276.1 = getelementptr i8*, i8** %204, i64 %idxprom.i.i
  %205 = ptrtoint i8** %arrayidx.i.i276.1 to i64
  call void @__asan_load8_noabort(i64 %205)
  %206 = load i8*, i8** %arrayidx.i.i276.1, align 8
  %arrayidx4.i.i277.1 = getelementptr i8, i8* %206, i64 1
  %207 = ptrtoint i8* %arrayidx4.i.i277.1 to i64
  call void @__asan_load1_noabort(i64 %207)
  %208 = load i8, i8* %arrayidx4.i.i277.1, align 1
  %209 = ptrtoint i8* %add.ptr.i.i.i278 to i64
  call void @__asan_store1_noabort(i64 %209)
  store i8 %208, i8* %add.ptr.i.i.i278, align 1
  %add.ptr.i.i.i278.1 = getelementptr i8, i8* %prog.023.i.i, i64 2
  call void @__sanitizer_cov_trace_const_cmp4(i32 2, i32 %spec.store.select.i.i)
  %cmp2.i.i280.1 = icmp eq i32 %spec.store.select.i.i, 2
  br i1 %cmp2.i.i280.1, label %do.body.i.i281.1.for.end.i.i282_crit_edge, label %do.body.i.i281.2

do.body.i.i281.1.for.end.i.i282_crit_edge:        ; preds = %do.body.i.i281.1
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.end.i.i282

do.body.i.i281.2:                                 ; preds = %do.body.i.i281.1
  call void @__asan_load8_noabort(i64 ptrtoint (i8*** @ideal_nops to i64))
  %210 = load i8**, i8*** @ideal_nops, align 8
  %arrayidx.i.i276.2 = getelementptr i8*, i8** %210, i64 %idxprom.i.i
  %211 = ptrtoint i8** %arrayidx.i.i276.2 to i64
  call void @__asan_load8_noabort(i64 %211)
  %212 = load i8*, i8** %arrayidx.i.i276.2, align 8
  %arrayidx4.i.i277.2 = getelementptr i8, i8* %212, i64 2
  %213 = ptrtoint i8* %arrayidx4.i.i277.2 to i64
  call void @__asan_load1_noabort(i64 %213)
  %214 = load i8, i8* %arrayidx4.i.i277.2, align 1
  %215 = ptrtoint i8* %add.ptr.i.i.i278.1 to i64
  call void @__asan_store1_noabort(i64 %215)
  store i8 %214, i8* %add.ptr.i.i.i278.1, align 1
  %add.ptr.i.i.i278.2 = getelementptr i8, i8* %prog.023.i.i, i64 3
  call void @__sanitizer_cov_trace_const_cmp4(i32 3, i32 %spec.store.select.i.i)
  %cmp2.i.i280.2 = icmp ugt i32 %spec.store.select.i.i, 3
  br i1 %cmp2.i.i280.2, label %do.body.i.i281.3, label %do.body.i.i281.2.for.end.i.i282_crit_edge

do.body.i.i281.2.for.end.i.i282_crit_edge:        ; preds = %do.body.i.i281.2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.end.i.i282

do.body.i.i281.3:                                 ; preds = %do.body.i.i281.2
  call void @__asan_load8_noabort(i64 ptrtoint (i8*** @ideal_nops to i64))
  %216 = load i8**, i8*** @ideal_nops, align 8
  %arrayidx.i.i276.3 = getelementptr i8*, i8** %216, i64 %idxprom.i.i
  %217 = ptrtoint i8** %arrayidx.i.i276.3 to i64
  call void @__asan_load8_noabort(i64 %217)
  %218 = load i8*, i8** %arrayidx.i.i276.3, align 8
  %arrayidx4.i.i277.3 = getelementptr i8, i8* %218, i64 3
  %219 = ptrtoint i8* %arrayidx4.i.i277.3 to i64
  call void @__asan_load1_noabort(i64 %219)
  %220 = load i8, i8* %arrayidx4.i.i277.3, align 1
  %221 = ptrtoint i8* %add.ptr.i.i.i278.2 to i64
  call void @__asan_store1_noabort(i64 %221)
  store i8 %220, i8* %add.ptr.i.i.i278.2, align 1
  %add.ptr.i.i.i278.3 = getelementptr i8, i8* %prog.023.i.i, i64 4
  call void @__sanitizer_cov_trace_const_cmp4(i32 4, i32 %spec.store.select.i.i)
  %cmp2.i.i280.3 = icmp eq i32 %spec.store.select.i.i, 4
  br i1 %cmp2.i.i280.3, label %do.body.i.i281.3.for.end.i.i282_crit_edge, label %do.body.i.i281.4

do.body.i.i281.3.for.end.i.i282_crit_edge:        ; preds = %do.body.i.i281.3
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.end.i.i282

do.body.i.i281.4:                                 ; preds = %do.body.i.i281.3
  call void @__asan_load8_noabort(i64 ptrtoint (i8*** @ideal_nops to i64))
  %222 = load i8**, i8*** @ideal_nops, align 8
  %arrayidx.i.i276.4 = getelementptr i8*, i8** %222, i64 %idxprom.i.i
  %223 = ptrtoint i8** %arrayidx.i.i276.4 to i64
  call void @__asan_load8_noabort(i64 %223)
  %224 = load i8*, i8** %arrayidx.i.i276.4, align 8
  %arrayidx4.i.i277.4 = getelementptr i8, i8* %224, i64 4
  %225 = ptrtoint i8* %arrayidx4.i.i277.4 to i64
  call void @__asan_load1_noabort(i64 %225)
  %226 = load i8, i8* %arrayidx4.i.i277.4, align 1
  %227 = ptrtoint i8* %add.ptr.i.i.i278.3 to i64
  call void @__asan_store1_noabort(i64 %227)
  store i8 %226, i8* %add.ptr.i.i.i278.3, align 1
  %add.ptr.i.i.i278.4 = getelementptr i8, i8* %prog.023.i.i, i64 5
  call void @__sanitizer_cov_trace_const_cmp4(i32 5, i32 %spec.store.select.i.i)
  %cmp2.i.i280.4 = icmp ugt i32 %spec.store.select.i.i, 5
  br i1 %cmp2.i.i280.4, label %do.body.i.i281.5, label %do.body.i.i281.4.for.end.i.i282_crit_edge

do.body.i.i281.4.for.end.i.i282_crit_edge:        ; preds = %do.body.i.i281.4
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.end.i.i282

do.body.i.i281.5:                                 ; preds = %do.body.i.i281.4
  call void @__asan_load8_noabort(i64 ptrtoint (i8*** @ideal_nops to i64))
  %228 = load i8**, i8*** @ideal_nops, align 8
  %arrayidx.i.i276.5 = getelementptr i8*, i8** %228, i64 %idxprom.i.i
  %229 = ptrtoint i8** %arrayidx.i.i276.5 to i64
  call void @__asan_load8_noabort(i64 %229)
  %230 = load i8*, i8** %arrayidx.i.i276.5, align 8
  %arrayidx4.i.i277.5 = getelementptr i8, i8* %230, i64 5
  %231 = ptrtoint i8* %arrayidx4.i.i277.5 to i64
  call void @__asan_load1_noabort(i64 %231)
  %232 = load i8, i8* %arrayidx4.i.i277.5, align 1
  %233 = ptrtoint i8* %add.ptr.i.i.i278.4 to i64
  call void @__asan_store1_noabort(i64 %233)
  store i8 %232, i8* %add.ptr.i.i.i278.4, align 1
  %add.ptr.i.i.i278.5 = getelementptr i8, i8* %prog.023.i.i, i64 6
  call void @__sanitizer_cov_trace_const_cmp4(i32 6, i32 %spec.store.select.i.i)
  %cmp2.i.i280.5 = icmp eq i32 %spec.store.select.i.i, 6
  br i1 %cmp2.i.i280.5, label %do.body.i.i281.5.for.end.i.i282_crit_edge, label %do.body.i.i281.6

do.body.i.i281.5.for.end.i.i282_crit_edge:        ; preds = %do.body.i.i281.5
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.end.i.i282

do.body.i.i281.6:                                 ; preds = %do.body.i.i281.5
  call void @__asan_load8_noabort(i64 ptrtoint (i8*** @ideal_nops to i64))
  %234 = load i8**, i8*** @ideal_nops, align 8
  %arrayidx.i.i276.6 = getelementptr i8*, i8** %234, i64 %idxprom.i.i
  %235 = ptrtoint i8** %arrayidx.i.i276.6 to i64
  call void @__asan_load8_noabort(i64 %235)
  %236 = load i8*, i8** %arrayidx.i.i276.6, align 8
  %arrayidx4.i.i277.6 = getelementptr i8, i8* %236, i64 6
  %237 = ptrtoint i8* %arrayidx4.i.i277.6 to i64
  call void @__asan_load1_noabort(i64 %237)
  %238 = load i8, i8* %arrayidx4.i.i277.6, align 1
  %239 = ptrtoint i8* %add.ptr.i.i.i278.5 to i64
  call void @__asan_store1_noabort(i64 %239)
  store i8 %238, i8* %add.ptr.i.i.i278.5, align 1
  %add.ptr.i.i.i278.6 = getelementptr i8, i8* %prog.023.i.i, i64 7
  call void @__sanitizer_cov_trace_const_cmp4(i32 7, i32 %spec.store.select.i.i)
  %cmp2.i.i280.6 = icmp ugt i32 %spec.store.select.i.i, 7
  br i1 %cmp2.i.i280.6, label %do.body.i.i281.7, label %do.body.i.i281.6.for.end.i.i282_crit_edge

do.body.i.i281.6.for.end.i.i282_crit_edge:        ; preds = %do.body.i.i281.6
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.end.i.i282

do.body.i.i281.7:                                 ; preds = %do.body.i.i281.6
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  call void @__asan_load8_noabort(i64 ptrtoint (i8*** @ideal_nops to i64))
  %240 = load i8**, i8*** @ideal_nops, align 8
  %arrayidx.i.i276.7 = getelementptr i8*, i8** %240, i64 %idxprom.i.i
  %241 = ptrtoint i8** %arrayidx.i.i276.7 to i64
  call void @__asan_load8_noabort(i64 %241)
  %242 = load i8*, i8** %arrayidx.i.i276.7, align 8
  %arrayidx4.i.i277.7 = getelementptr i8, i8* %242, i64 7
  %243 = ptrtoint i8* %arrayidx4.i.i277.7 to i64
  call void @__asan_load1_noabort(i64 %243)
  %244 = load i8, i8* %arrayidx4.i.i277.7, align 1
  %245 = ptrtoint i8* %add.ptr.i.i.i278.6 to i64
  call void @__asan_store1_noabort(i64 %245)
  store i8 %244, i8* %add.ptr.i.i.i278.6, align 1
  %add.ptr.i.i.i278.7 = getelementptr i8, i8* %prog.023.i.i, i64 8
  br label %for.end.i.i282
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: noredzone nounwind sanitize_address sspstrong
define internal fastcc void @emit_stx(i8** nocapture %pprog, i32 %size, i32 %dst_reg, i32 %src_reg, i32 %off) unnamed_addr #0 {
entry:
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %0 = ptrtoint i8** %pprog to i64
  call void @__asan_load8_noabort(i64 %0)
  %1 = load i8*, i8** %pprog, align 8
  %2 = lshr i32 %size, 3
  %3 = shl i32 %size, 29
  %4 = or i32 %2, %3
  %5 = zext i32 %4 to i64
  call void @__sanitizer_cov_trace_switch(i64 %5, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__sancov_gen_cov_switch_values, i32 0, i32 0))
  switch i32 %4, label %entry.sw.epilog_crit_edge [
    i32 2, label %sw.bb
    i32 1, label %sw.bb10
    i32 0, label %sw.bb33
    i32 3, label %do.body56
  ]

entry.sw.epilog_crit_edge:                        ; preds = %entry
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.epilog

sw.bb:                                            ; preds = %entry
  %shl.i = shl nuw i32 1, %dst_reg
  %6 = and i32 %shl.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %6)
  %tobool.i = icmp ne i32 %6, 0
  %.pre = shl nuw i32 1, %src_reg
  %tobool.i.not = xor i1 %tobool.i, true
  %7 = and i32 %.pre, 28582
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %7)
  %8 = icmp eq i32 %7, 0
  %or.cond = and i1 %8, %tobool.i.not
  br i1 %or.cond, label %do.body5, label %do.body

do.body:                                          ; preds = %sw.bb
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %9 = zext i1 %tobool.i to i16
  %10 = and i32 %.pre, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %10)
  %tobool.i11.i163 = icmp eq i32 %10, 0
  %byte.addr.1.i164.v = select i1 %tobool.i11.i163, i16 64, i16 68
  %byte.addr.1.i164 = or i16 %byte.addr.1.i164.v, %9
  %add = or i16 %byte.addr.1.i164, -30720
  %11 = bitcast i8* %1 to i16*
  %12 = ptrtoint i16* %11 to i64
  call void @__asan_store2_noabort(i64 %12)
  store i16 %add, i16* %11, align 2
  %add.ptr.i177 = getelementptr i8, i8* %1, i64 2
  br label %sw.epilog

do.body5:                                         ; preds = %sw.bb
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %13 = ptrtoint i8* %1 to i64
  call void @__asan_store1_noabort(i64 %13)
  store i8 -120, i8* %1, align 1
  %add.ptr.i175 = getelementptr i8, i8* %1, i64 1
  br label %sw.epilog

sw.bb10:                                          ; preds = %entry
  %shl.i173 = shl nuw i32 1, %dst_reg
  %14 = and i32 %shl.i173, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %14)
  %tobool.i174 = icmp ne i32 %14, 0
  %.pre178 = shl nuw i32 1, %src_reg
  %.pre179 = and i32 %.pre178, 27552
  %tobool.i174.not = xor i1 %tobool.i174, true
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %.pre179)
  %tobool.i172 = icmp eq i32 %.pre179, 0
  %or.cond184 = and i1 %tobool.i172, %tobool.i174.not
  br i1 %or.cond184, label %do.body27, label %do.body17

do.body17:                                        ; preds = %sw.bb10
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %15 = zext i1 %tobool.i174 to i32
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %.pre179)
  %tobool.i11.i169 = icmp eq i32 %.pre179, 0
  %byte.addr.1.i170.v = select i1 %tobool.i11.i169, i32 64, i32 68
  %byte.addr.1.i170 = or i32 %byte.addr.1.i170.v, %15
  %shl = shl nuw nsw i32 %byte.addr.1.i170, 8
  %add21 = or i32 %shl, 8978534
  %16 = bitcast i8* %1 to i32*
  %17 = ptrtoint i32* %16 to i64
  call void @__asan_store4_noabort(i64 %17)
  store i32 %add21, i32* %16, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i158 = getelementptr i8, i8* %1, i64 3
  br label %sw.epilog

do.body27:                                        ; preds = %sw.bb10
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %18 = bitcast i8* %1 to i16*
  %19 = ptrtoint i16* %18 to i64
  call void @__asan_store2_noabort(i64 %19)
  store i16 -30362, i16* %18, align 2
  %add.ptr.i157 = getelementptr i8, i8* %1, i64 2
  br label %sw.epilog

sw.bb33:                                          ; preds = %entry
  %shl.i155 = shl nuw i32 1, %dst_reg
  %20 = and i32 %shl.i155, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %20)
  %tobool.i156 = icmp ne i32 %20, 0
  %.pre180 = shl nuw i32 1, %src_reg
  %.pre181 = and i32 %.pre180, 27552
  %tobool.i156.not = xor i1 %tobool.i156, true
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %.pre181)
  %tobool.i154 = icmp eq i32 %.pre181, 0
  %or.cond185 = and i1 %tobool.i154, %tobool.i156.not
  br i1 %or.cond185, label %do.body49, label %do.body40

do.body40:                                        ; preds = %sw.bb33
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %21 = zext i1 %tobool.i156 to i16
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %.pre181)
  %tobool.i11.i151 = icmp eq i32 %.pre181, 0
  %byte.addr.1.i152.v = select i1 %tobool.i11.i151, i16 64, i16 68
  %byte.addr.1.i152 = or i16 %byte.addr.1.i152.v, %21
  %add43 = or i16 %byte.addr.1.i152, -30464
  %22 = bitcast i8* %1 to i16*
  %23 = ptrtoint i16* %22 to i64
  call void @__asan_store2_noabort(i64 %23)
  store i16 %add43, i16* %22, align 2
  %add.ptr.i146 = getelementptr i8, i8* %1, i64 2
  br label %sw.epilog

do.body49:                                        ; preds = %sw.bb33
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %24 = ptrtoint i8* %1 to i64
  call void @__asan_store1_noabort(i64 %24)
  store i8 -119, i8* %1, align 1
  %add.ptr.i144 = getelementptr i8, i8* %1, i64 1
  br label %sw.epilog

do.body56:                                        ; preds = %entry
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %shl.i.i143 = shl nuw i32 1, %dst_reg
  %25 = and i32 %shl.i.i143, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %25)
  %tobool.i.i = icmp ne i32 %25, 0
  %26 = zext i1 %tobool.i.i to i16
  %shl.i10.i = shl nuw i32 1, %src_reg
  %27 = and i32 %shl.i10.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %27)
  %tobool.i11.i = icmp eq i32 %27, 0
  %byte.addr.1.i.v = select i1 %tobool.i11.i, i16 72, i16 76
  %byte.addr.1.i = or i16 %byte.addr.1.i.v, %26
  %add59 = or i16 %byte.addr.1.i, -30464
  %28 = bitcast i8* %1 to i16*
  %29 = ptrtoint i16* %28 to i64
  call void @__asan_store2_noabort(i64 %29)
  store i16 %add59, i16* %28, align 2
  %add.ptr.i142 = getelementptr i8, i8* %1, i64 2
  br label %sw.epilog

sw.epilog:                                        ; preds = %entry.sw.epilog_crit_edge, %do.body40, %do.body49, %do.body17, %do.body27, %do.body, %do.body5, %do.body56
  %prog.0 = phi i8* [ %1, %entry.sw.epilog_crit_edge ], [ %add.ptr.i142, %do.body56 ], [ %add.ptr.i146, %do.body40 ], [ %add.ptr.i144, %do.body49 ], [ %add.ptr.i158, %do.body17 ], [ %add.ptr.i157, %do.body27 ], [ %add.ptr.i177, %do.body ], [ %add.ptr.i175, %do.body5 ]
  %value.off.i = add i32 %off, 128
  call void @__sanitizer_cov_trace_const_cmp4(i32 256, i32 %value.off.i)
  %30 = icmp ult i32 %value.off.i, 256
  %idxprom.i133 = zext i32 %dst_reg to i64
  %arrayidx.i134 = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom.i133
  %31 = ptrtoint i32* %arrayidx.i134 to i64
  call void @__asan_load4_noabort(i64 %31)
  %32 = load i32, i32* %arrayidx.i134, align 4
  br i1 %30, label %do.body66, label %do.body77

do.body66:                                        ; preds = %sw.epilog
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %add.i135 = add i32 %32, 64
  %idxprom1.i136 = zext i32 %src_reg to i64
  %arrayidx2.i137 = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom1.i136
  %33 = ptrtoint i32* %arrayidx2.i137 to i64
  call void @__asan_load4_noabort(i64 %33)
  %34 = load i32, i32* %arrayidx2.i137, align 4
  %shl.i138 = shl i32 %34, 3
  %add3.i139 = add i32 %add.i135, %shl.i138
  %conv68 = and i32 %add3.i139, 255
  %shl69 = shl nsw i32 %off, 8
  %add70 = or i32 %conv68, %shl69
  %conv4.i131 = trunc i32 %add70 to i16
  %35 = bitcast i8* %prog.0 to i16*
  %36 = ptrtoint i16* %35 to i64
  call void @__asan_store2_noabort(i64 %36)
  store i16 %conv4.i131, i16* %35, align 2
  br label %if.end91

do.body77:                                        ; preds = %sw.epilog
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %add.i = add i32 %32, 128
  %idxprom1.i = zext i32 %src_reg to i64
  %arrayidx2.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom1.i
  %37 = ptrtoint i32* %arrayidx2.i to i64
  call void @__asan_load4_noabort(i64 %37)
  %38 = load i32, i32* %arrayidx2.i, align 4
  %shl.i130 = shl i32 %38, 3
  %add3.i = add i32 %add.i, %shl.i130
  %conv4.i = trunc i32 %add3.i to i8
  %39 = ptrtoint i8* %prog.0 to i64
  call void @__asan_store1_noabort(i64 %39)
  store i8 %conv4.i, i8* %prog.0, align 1
  %add.ptr.i129 = getelementptr i8, i8* %prog.0, i64 1
  %40 = bitcast i8* %add.ptr.i129 to i32*
  %41 = ptrtoint i32* %40 to i64
  call void @__asan_store4_noabort(i64 %41)
  store i32 %off, i32* %40, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  br label %if.end91

if.end91:                                         ; preds = %do.body77, %do.body66
  %.sink = phi i64 [ 5, %do.body77 ], [ 2, %do.body66 ]
  %add.ptr.i = getelementptr i8, i8* %prog.0, i64 %.sink
  %42 = ptrtoint i8** %pprog to i64
  call void @__asan_store8_noabort(i64 %42)
  store i8* %add.ptr.i, i8** %pprog, align 8
  ret void
}

; Function Attrs: noredzone nounwind sanitize_address sspstrong
define internal fastcc void @emit_ldx(i8** nocapture %pprog, i32 %size, i32 %dst_reg, i32 %src_reg, i32 %off) unnamed_addr #0 {
entry:
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %0 = ptrtoint i8** %pprog to i64
  call void @__asan_load8_noabort(i64 %0)
  %1 = load i8*, i8** %pprog, align 8
  %2 = lshr i32 %size, 3
  %3 = shl i32 %size, 29
  %4 = or i32 %2, %3
  %5 = zext i32 %4 to i64
  call void @__sanitizer_cov_trace_switch(i64 %5, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__sancov_gen_cov_switch_values.23, i32 0, i32 0))
  switch i32 %4, label %entry.sw.epilog_crit_edge [
    i32 2, label %do.body
    i32 1, label %do.body5
    i32 0, label %sw.bb14
    i32 3, label %do.body33
  ]

entry.sw.epilog_crit_edge:                        ; preds = %entry
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.epilog

do.body:                                          ; preds = %entry
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %shl.i.i = shl nuw i32 1, %src_reg
  %6 = and i32 %shl.i.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %6)
  %tobool.i.i = icmp ne i32 %6, 0
  %7 = zext i1 %tobool.i.i to i32
  %shl.i10.i = shl nuw i32 1, %dst_reg
  %8 = and i32 %shl.i10.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %8)
  %tobool.i11.i = icmp eq i32 %8, 0
  %byte.addr.1.i = select i1 %tobool.i11.i, i32 11931464, i32 11931468
  %add1 = or i32 %byte.addr.1.i, %7
  %9 = bitcast i8* %1 to i32*
  %10 = ptrtoint i32* %9 to i64
  call void @__asan_store4_noabort(i64 %10)
  store i32 %add1, i32* %9, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i97 = getelementptr i8, i8* %1, i64 3
  br label %sw.epilog

do.body5:                                         ; preds = %entry
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %shl.i.i98 = shl nuw i32 1, %src_reg
  %11 = and i32 %shl.i.i98, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %11)
  %tobool.i.i99 = icmp ne i32 %11, 0
  %12 = zext i1 %tobool.i.i99 to i32
  %shl.i10.i101 = shl nuw i32 1, %dst_reg
  %13 = and i32 %shl.i10.i101, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %13)
  %tobool.i11.i102 = icmp eq i32 %13, 0
  %byte.addr.1.i103 = select i1 %tobool.i11.i102, i32 11997000, i32 11997004
  %add9 = or i32 %byte.addr.1.i103, %12
  %14 = bitcast i8* %1 to i32*
  %15 = ptrtoint i32* %14 to i64
  call void @__asan_store4_noabort(i64 %15)
  store i32 %add9, i32* %14, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i135 = getelementptr i8, i8* %1, i64 3
  br label %sw.epilog

sw.bb14:                                          ; preds = %entry
  %shl.i133 = shl nuw i32 1, %dst_reg
  %shl.i132 = shl nuw i32 1, %src_reg
  %16 = or i32 %shl.i133, %shl.i132
  %17 = and i32 %16, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %17)
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %do.body27, label %do.body19

do.body19:                                        ; preds = %sw.bb14
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %19 = and i32 %shl.i133, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %19)
  %tobool.i134 = icmp eq i32 %19, 0
  %20 = and i32 %shl.i132, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %20)
  %tobool.i.i127 = icmp ne i32 %20, 0
  %21 = zext i1 %tobool.i.i127 to i16
  %byte.addr.1.i131 = select i1 %tobool.i134, i16 -29888, i16 -29884
  %add22 = or i16 %byte.addr.1.i131, %21
  %22 = bitcast i8* %1 to i16*
  %23 = ptrtoint i16* %22 to i64
  call void @__asan_store2_noabort(i64 %23)
  store i16 %add22, i16* %22, align 2
  %add.ptr.i125 = getelementptr i8, i8* %1, i64 2
  br label %sw.epilog

do.body27:                                        ; preds = %sw.bb14
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %24 = ptrtoint i8* %1 to i64
  call void @__asan_store1_noabort(i64 %24)
  store i8 -117, i8* %1, align 1
  %add.ptr.i123 = getelementptr i8, i8* %1, i64 1
  br label %sw.epilog

do.body33:                                        ; preds = %entry
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %shl.i.i117 = shl nuw i32 1, %src_reg
  %25 = and i32 %shl.i.i117, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %25)
  %tobool.i.i118 = icmp ne i32 %25, 0
  %26 = zext i1 %tobool.i.i118 to i16
  %shl.i10.i120 = shl nuw i32 1, %dst_reg
  %27 = and i32 %shl.i10.i120, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %27)
  %tobool.i11.i121 = icmp eq i32 %27, 0
  %byte.addr.1.i122 = select i1 %tobool.i11.i121, i16 -29880, i16 -29876
  %add36 = or i16 %byte.addr.1.i122, %26
  %28 = bitcast i8* %1 to i16*
  %29 = ptrtoint i16* %28 to i64
  call void @__asan_store2_noabort(i64 %29)
  store i16 %add36, i16* %28, align 2
  %add.ptr.i116 = getelementptr i8, i8* %1, i64 2
  br label %sw.epilog

sw.epilog:                                        ; preds = %entry.sw.epilog_crit_edge, %do.body19, %do.body27, %do.body33, %do.body5, %do.body
  %prog.0 = phi i8* [ %1, %entry.sw.epilog_crit_edge ], [ %add.ptr.i116, %do.body33 ], [ %add.ptr.i125, %do.body19 ], [ %add.ptr.i123, %do.body27 ], [ %add.ptr.i135, %do.body5 ], [ %add.ptr.i97, %do.body ]
  %value.off.i = add i32 %off, 128
  call void @__sanitizer_cov_trace_const_cmp4(i32 256, i32 %value.off.i)
  %30 = icmp ult i32 %value.off.i, 256
  %idxprom.i107 = zext i32 %src_reg to i64
  %arrayidx.i108 = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom.i107
  %31 = ptrtoint i32* %arrayidx.i108 to i64
  call void @__asan_load4_noabort(i64 %31)
  %32 = load i32, i32* %arrayidx.i108, align 4
  br i1 %30, label %do.body43, label %do.body53

do.body43:                                        ; preds = %sw.epilog
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %add.i109 = add i32 %32, 64
  %idxprom1.i110 = zext i32 %dst_reg to i64
  %arrayidx2.i111 = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom1.i110
  %33 = ptrtoint i32* %arrayidx2.i111 to i64
  call void @__asan_load4_noabort(i64 %33)
  %34 = load i32, i32* %arrayidx2.i111, align 4
  %shl.i112 = shl i32 %34, 3
  %add3.i113 = add i32 %add.i109, %shl.i112
  %conv45 = and i32 %add3.i113, 255
  %shl = shl nsw i32 %off, 8
  %add46 = or i32 %conv45, %shl
  %conv4.i105 = trunc i32 %add46 to i16
  %35 = bitcast i8* %prog.0 to i16*
  %36 = ptrtoint i16* %35 to i64
  call void @__asan_store2_noabort(i64 %36)
  store i16 %conv4.i105, i16* %35, align 2
  br label %if.end67

do.body53:                                        ; preds = %sw.epilog
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %add.i = add i32 %32, 128
  %idxprom1.i = zext i32 %dst_reg to i64
  %arrayidx2.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom1.i
  %37 = ptrtoint i32* %arrayidx2.i to i64
  call void @__asan_load4_noabort(i64 %37)
  %38 = load i32, i32* %arrayidx2.i, align 4
  %shl.i = shl i32 %38, 3
  %add3.i = add i32 %add.i, %shl.i
  %conv4.i = trunc i32 %add3.i to i8
  %39 = ptrtoint i8* %prog.0 to i64
  call void @__asan_store1_noabort(i64 %39)
  store i8 %conv4.i, i8* %prog.0, align 1
  %add.ptr.i104 = getelementptr i8, i8* %prog.0, i64 1
  %40 = bitcast i8* %add.ptr.i104 to i32*
  %41 = ptrtoint i32* %40 to i64
  call void @__asan_store4_noabort(i64 %41)
  store i32 %off, i32* %40, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  br label %if.end67

if.end67:                                         ; preds = %do.body53, %do.body43
  %.sink = phi i64 [ 5, %do.body53 ], [ 2, %do.body43 ]
  %add.ptr.i = getelementptr i8, i8* %prog.0, i64 %.sink
  %42 = ptrtoint i8** %pprog to i64
  call void @__asan_store8_noabort(i64 %42)
  store i8* %add.ptr.i, i8** %pprog, align 8
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: noredzone
declare dso_local void @kfree(i8*) local_unnamed_addr #1

; Function Attrs: noredzone nounwind sanitize_address sspstrong
define dso_local i32 @arch_prepare_bpf_dispatcher(i8* %image, i64* %funcs, i32 %num_funcs) local_unnamed_addr #0 {
entry:
  %prog = alloca i8*, align 8
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %0 = bitcast i8** %prog to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #15
  %1 = ptrtoint i8** %prog to i64
  call void @__asan_store8_noabort(i64 %1)
  store i8* %image, i8** %prog, align 8
  %2 = bitcast i64* %funcs to i8*
  %conv = sext i32 %num_funcs to i64
  tail call void @sort(i8* %2, i64 %conv, i64 8, i32 (i8*, i8*)* nonnull @cmp_ips, void (i8*, i8*, i32)* null) #13
  %sub = add i32 %num_funcs, -1
  %call = call fastcc i32 @emit_bpf_dispatcher(i8** nonnull %prog, i32 0, i32 %sub, i64* %funcs) #14
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0) #15
  ret i32 %call
}

; Function Attrs: noredzone
declare dso_local void @sort(i8*, i64, i64, i32 (i8*, i8*)*, void (i8*, i8*, i32)*) local_unnamed_addr #1

; Function Attrs: norecurse noredzone nounwind readonly sanitize_address sspstrong
define internal i32 @cmp_ips(i8* nocapture readonly %a, i8* nocapture readonly %b) #3 {
entry:
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %0 = bitcast i8* %a to i64*
  %1 = bitcast i8* %b to i64*
  %2 = ptrtoint i64* %0 to i64
  call void @__asan_load8_noabort(i64 %2)
  %3 = load i64, i64* %0, align 8
  %4 = ptrtoint i64* %1 to i64
  call void @__asan_load8_noabort(i64 %4)
  %5 = load i64, i64* %1, align 8
  call void @__sanitizer_cov_trace_cmp8(i64 %3, i64 %5)
  %cmp = icmp sgt i64 %3, %5
  call void @__sanitizer_cov_trace_cmp8(i64 %3, i64 %5)
  %cmp1 = icmp slt i64 %3, %5
  %. = sext i1 %cmp1 to i32
  %retval.0 = select i1 %cmp, i32 1, i32 %.
  ret i32 %retval.0
}

; Function Attrs: noredzone nounwind sanitize_address sspstrong
define internal fastcc i32 @emit_bpf_dispatcher(i8** nocapture %pprog, i32 %a, i32 %b, i64* readonly %progs) unnamed_addr #0 {
entry:
  %prog = alloca i8*, align 8
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %0 = bitcast i8** %prog to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #15
  %1 = ptrtoint i8** %pprog to i64
  call void @__asan_load8_noabort(i64 %1)
  %2 = load i8*, i8** %pprog, align 8
  %3 = ptrtoint i8** %prog to i64
  call void @__asan_store8_noabort(i64 %3)
  store i8* %2, i8** %prog, align 8
  call void @__sanitizer_cov_trace_cmp4(i32 %b, i32 %a)
  %cmp = icmp eq i32 %b, %a
  br i1 %cmp, label %do.body, label %if.end32

do.body:                                          ; preds = %entry
  %4 = ptrtoint i8* %2 to i64
  call void @__asan_store1_noabort(i64 %4)
  store i8 72, i8* %2, align 1
  %add.ptr.i = getelementptr i8, i8* %2, i64 1
  %5 = ptrtoint i8** %prog to i64
  call void @__asan_store8_noabort(i64 %5)
  store i8* %add.ptr.i, i8** %prog, align 8
  %idxprom = sext i32 %b to i64
  %arrayidx = getelementptr i64, i64* %progs, i64 %idxprom
  %6 = ptrtoint i64* %arrayidx to i64
  call void @__asan_load8_noabort(i64 %6)
  %7 = load i64, i64* %arrayidx, align 8
  %8 = add i64 %7, 2147483648
  call void @__sanitizer_cov_trace_const_cmp8(i64 4294967296, i64 %8)
  %9 = icmp ult i64 %8, 4294967296
  br i1 %9, label %do.body5, label %do.body.cleanup_crit_edge

do.body.cleanup_crit_edge:                        ; preds = %do.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %cleanup

do.body5:                                         ; preds = %do.body
  %10 = bitcast i8* %add.ptr.i to i16*
  %11 = ptrtoint i16* %10 to i64
  call void @__asan_store2_noabort(i64 %11)
  store i16 -1407, i16* %10, align 2
  %add.ptr.i162 = getelementptr i8, i8* %2, i64 3
  %12 = ptrtoint i64* %arrayidx to i64
  call void @__asan_load8_noabort(i64 %12)
  %13 = load i64, i64* %arrayidx, align 8
  %conv16 = trunc i64 %13 to i32
  %14 = bitcast i8* %add.ptr.i162 to i32*
  %15 = ptrtoint i32* %14 to i64
  call void @__asan_store4_noabort(i64 %15)
  store i32 %conv16, i32* %14, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i168 = getelementptr i8, i8* %2, i64 7
  %16 = ptrtoint i8** %prog to i64
  call void @__asan_store8_noabort(i64 %16)
  store i8* %add.ptr.i168, i8** %prog, align 8
  %17 = bitcast i64* %arrayidx to i8**
  %18 = ptrtoint i8** %17 to i64
  call void @__asan_load8_noabort(i64 %18)
  %19 = load i8*, i8** %17, align 8
  %add.ptr1.i = getelementptr i8, i8* %2, i64 13
  %sub.ptr.lhs.cast.i = ptrtoint i8* %19 to i64
  %sub.ptr.rhs.cast.i = ptrtoint i8* %add.ptr1.i to i64
  %sub.ptr.sub.i169 = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %20 = add i64 %sub.ptr.sub.i169, 2147483648
  call void @__sanitizer_cov_trace_const_cmp8(i64 4294967296, i64 %20)
  %21 = icmp ult i64 %20, 4294967296
  br i1 %21, label %if.end27, label %emit_cond_near_jump.exit

emit_cond_near_jump.exit:                         ; preds = %do.body5
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %call2.i = tail call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.3, i64 0, i64 0), i8* %19) #16
  br label %cleanup

if.end27:                                         ; preds = %do.body5
  %22 = bitcast i8* %add.ptr.i168 to i16*
  %23 = ptrtoint i16* %22 to i64
  call void @__asan_store2_noabort(i64 %23)
  store i16 -31729, i16* %22, align 2
  %add.ptr.i26.i = getelementptr i8, i8* %2, i64 9
  %conv8.i = trunc i64 %sub.ptr.sub.i169 to i32
  %24 = bitcast i8* %add.ptr.i26.i to i32*
  %25 = ptrtoint i32* %24 to i64
  call void @__asan_store4_noabort(i64 %25)
  store i32 %conv8.i, i32* %24, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %26 = ptrtoint i8** %prog to i64
  call void @__asan_store8_noabort(i64 %26)
  store i8* %add.ptr1.i, i8** %prog, align 8
  %add.ptr.i.i.i171 = getelementptr i8, i8* %2, i64 18
  %sub.ptr.rhs.cast.i.i.i = ptrtoint i8* %add.ptr.i.i.i171 to i64
  %27 = sub i64 add (i64 ptrtoint (void ()* @__x86_indirect_thunk_rdx to i64), i64 2147483648), %sub.ptr.rhs.cast.i.i.i
  call void @__sanitizer_cov_trace_const_cmp8(i64 4294967296, i64 %27)
  %28 = icmp ult i64 %27, 4294967296
  br i1 %28, label %if.end31, label %emit_fallback_jump.exit

emit_fallback_jump.exit:                          ; preds = %if.end27
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %call1.i.i.i = tail call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.2, i64 0, i64 0), i8* bitcast (void ()* @__x86_indirect_thunk_rdx to i8*)) #16
  %29 = bitcast i8** %prog to i64*
  %30 = ptrtoint i64* %29 to i64
  call void @__asan_store8_noabort(i64 %30)
  store i64 %sub.ptr.rhs.cast.i, i64* %29, align 8
  br label %cleanup

if.end31:                                         ; preds = %if.end27
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %31 = ptrtoint i8* %add.ptr1.i to i64
  call void @__asan_store1_noabort(i64 %31)
  store i8 -23, i8* %add.ptr1.i, align 1
  %add.ptr.i23.i.i.i = getelementptr i8, i8* %2, i64 14
  %32 = trunc i64 %sub.ptr.rhs.cast.i.i.i to i32
  %conv5.i.i.i = sub i32 ptrtoint (void ()* @__x86_indirect_thunk_rdx to i32), %32
  %33 = bitcast i8* %add.ptr.i23.i.i.i to i32*
  %34 = ptrtoint i32* %33 to i64
  call void @__asan_store4_noabort(i64 %34)
  store i32 %conv5.i.i.i, i32* %33, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %35 = bitcast i8** %prog to i64*
  %36 = ptrtoint i64* %35 to i64
  call void @__asan_store8_noabort(i64 %36)
  store i64 %sub.ptr.rhs.cast.i.i.i, i64* %35, align 8
  %37 = bitcast i8** %pprog to i64*
  %38 = ptrtoint i64* %37 to i64
  call void @__asan_store8_noabort(i64 %38)
  store i64 %sub.ptr.rhs.cast.i.i.i, i64* %37, align 8
  br label %cleanup

if.end32:                                         ; preds = %entry
  %sub = sub i32 %b, %a
  %div = sdiv i32 %sub, 2
  %39 = ptrtoint i8* %2 to i64
  call void @__asan_store1_noabort(i64 %39)
  store i8 72, i8* %2, align 1
  %add.ptr.i174 = getelementptr i8, i8* %2, i64 1
  %40 = ptrtoint i8** %prog to i64
  call void @__asan_store8_noabort(i64 %40)
  store i8* %add.ptr.i174, i8** %prog, align 8
  %add40 = add i32 %div, %a
  %idxprom41 = sext i32 %add40 to i64
  %arrayidx42 = getelementptr i64, i64* %progs, i64 %idxprom41
  %41 = ptrtoint i64* %arrayidx42 to i64
  call void @__asan_load8_noabort(i64 %41)
  %42 = load i64, i64* %arrayidx42, align 8
  %43 = add i64 %42, 2147483648
  call void @__sanitizer_cov_trace_const_cmp8(i64 4294967296, i64 %43)
  %44 = icmp ult i64 %43, 4294967296
  br i1 %44, label %do.body47, label %if.end32.cleanup_crit_edge

if.end32.cleanup_crit_edge:                       ; preds = %if.end32
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %cleanup

do.body47:                                        ; preds = %if.end32
  %45 = bitcast i8* %add.ptr.i174 to i16*
  %46 = ptrtoint i16* %45 to i64
  call void @__asan_store2_noabort(i64 %46)
  store i16 -1407, i16* %45, align 2
  %add.ptr.i177 = getelementptr i8, i8* %2, i64 3
  %47 = ptrtoint i64* %arrayidx42 to i64
  call void @__asan_load8_noabort(i64 %47)
  %48 = load i64, i64* %arrayidx42, align 8
  %conv60 = trunc i64 %48 to i32
  %49 = bitcast i8* %add.ptr.i177 to i32*
  %50 = ptrtoint i32* %49 to i64
  call void @__asan_store4_noabort(i64 %50)
  store i32 %conv60, i32* %49, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i166 = getelementptr i8, i8* %2, i64 7
  %51 = ptrtoint i8** %prog to i64
  call void @__asan_store8_noabort(i64 %51)
  store i8* %add.ptr.i166, i8** %prog, align 8
  call void @__sanitizer_cov_trace_const_cmp4(i32 5, i32 %sub)
  %cmp67 = icmp sgt i32 %sub, 5
  %52 = bitcast i8* %add.ptr.i166 to i16*
  br i1 %cmp67, label %if.then69, label %do.body83

if.then69:                                        ; preds = %do.body47
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %53 = ptrtoint i16* %52 to i64
  call void @__asan_store2_noabort(i64 %53)
  store i16 -28913, i16* %52, align 2
  %add.ptr.i164 = getelementptr i8, i8* %2, i64 9
  %54 = ptrtoint i8** %prog to i64
  call void @__asan_store8_noabort(i64 %54)
  store i8* %add.ptr.i164, i8** %prog, align 8
  %55 = bitcast i8* %add.ptr.i164 to i32*
  %56 = ptrtoint i32* %55 to i64
  call void @__asan_store4_noabort(i64 %56)
  store i32 0, i32* %55, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  br label %if.end88

do.body83:                                        ; preds = %do.body47
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %57 = ptrtoint i16* %52 to i64
  call void @__asan_store2_noabort(i64 %57)
  store i16 127, i16* %52, align 2
  br label %if.end88

if.end88:                                         ; preds = %do.body83, %if.then69
  %.sink = phi i64 [ 9, %do.body83 ], [ 13, %if.then69 ]
  %jg_bytes.0 = phi i32 [ 1, %do.body83 ], [ 4, %if.then69 ]
  %add.ptr.i158 = getelementptr i8, i8* %2, i64 %.sink
  %58 = ptrtoint i8** %prog to i64
  call void @__asan_store8_noabort(i64 %58)
  store i8* %add.ptr.i158, i8** %prog, align 8
  %call90 = call fastcc i32 @emit_bpf_dispatcher(i8** nonnull %prog, i32 %a, i32 %add40, i64* %progs) #14
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %call90)
  %tobool91 = icmp eq i32 %call90, 0
  br i1 %tobool91, label %if.end93, label %if.end88.cleanup_crit_edge

if.end88.cleanup_crit_edge:                       ; preds = %if.end88
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %cleanup

if.end93:                                         ; preds = %if.end88
  %59 = ptrtoint i8** %prog to i64
  call void @__asan_load8_noabort(i64 %59)
  %60 = load i8*, i8** %prog, align 8
  %61 = ptrtoint i8* %60 to i64
  %add.i = add i64 %61, 15
  %and.i = and i64 %add.i, -16
  %62 = inttoptr i64 %and.i to i8*
  %cmp.i = icmp eq i8* %60, %62
  br i1 %cmp.i, label %if.end93.emit_align.exit_crit_edge, label %if.then.i

if.end93.emit_align.exit_crit_edge:               ; preds = %if.end93
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit_align.exit

if.then.i:                                        ; preds = %if.end93
  %sub.ptr.sub.i = sub i64 %and.i, %61
  %conv4.i = trunc i64 %sub.ptr.sub.i to i32
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %conv4.i)
  %cmp21.i.i = icmp eq i32 %conv4.i, 0
  br i1 %cmp21.i.i, label %if.then.i.emit_align.exit_crit_edge, label %if.then.i.while.body.i.i_crit_edge

if.then.i.while.body.i.i_crit_edge:               ; preds = %if.then.i
  br label %while.body.i.i

if.then.i.emit_align.exit_crit_edge:              ; preds = %if.then.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit_align.exit

while.body.i.i:                                   ; preds = %for.end.i.i.while.body.i.i_crit_edge, %if.then.i.while.body.i.i_crit_edge
  %prog.023.i.i = phi i8* [ %add.ptr.i.i.i.lcssa, %for.end.i.i.while.body.i.i_crit_edge ], [ %60, %if.then.i.while.body.i.i_crit_edge ]
  %len.addr.022.i.i = phi i32 [ %sub.i.i, %for.end.i.i.while.body.i.i_crit_edge ], [ %conv4.i, %if.then.i.while.body.i.i_crit_edge ]
  call void @__sanitizer_cov_trace_const_cmp4(i32 8, i32 %len.addr.022.i.i)
  %63 = icmp ult i32 %len.addr.022.i.i, 8
  %spec.store.select.i.i = select i1 %63, i32 %len.addr.022.i.i, i32 8
  %idxprom.i.i = zext i32 %spec.store.select.i.i to i64
  call void @__asan_load8_noabort(i64 ptrtoint (i8*** @ideal_nops to i64))
  %64 = load i8**, i8*** @ideal_nops, align 8
  %arrayidx.i.i = getelementptr i8*, i8** %64, i64 %idxprom.i.i
  %65 = ptrtoint i8** %arrayidx.i.i to i64
  call void @__asan_load8_noabort(i64 %65)
  %66 = load i8*, i8** %arrayidx.i.i, align 8
  %67 = ptrtoint i8* %66 to i64
  call void @__asan_load1_noabort(i64 %67)
  %68 = load i8, i8* %66, align 1
  %69 = ptrtoint i8* %prog.023.i.i to i64
  call void @__asan_store1_noabort(i64 %69)
  store i8 %68, i8* %prog.023.i.i, align 1
  %add.ptr.i.i.i = getelementptr i8, i8* %prog.023.i.i, i64 1
  call void @__sanitizer_cov_trace_const_cmp4(i32 1, i32 %spec.store.select.i.i)
  %cmp2.i.i = icmp ugt i32 %spec.store.select.i.i, 1
  br i1 %cmp2.i.i, label %do.body.i.i.1, label %while.body.i.i.for.end.i.i_crit_edge

while.body.i.i.for.end.i.i_crit_edge:             ; preds = %while.body.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.end.i.i

for.end.i.i:                                      ; preds = %do.body.i.i.6.for.end.i.i_crit_edge, %do.body.i.i.5.for.end.i.i_crit_edge, %do.body.i.i.4.for.end.i.i_crit_edge, %do.body.i.i.3.for.end.i.i_crit_edge, %do.body.i.i.2.for.end.i.i_crit_edge, %do.body.i.i.1.for.end.i.i_crit_edge, %while.body.i.i.for.end.i.i_crit_edge, %do.body.i.i.7
  %add.ptr.i.i.i.lcssa = phi i8* [ %add.ptr.i.i.i, %while.body.i.i.for.end.i.i_crit_edge ], [ %add.ptr.i.i.i.1, %do.body.i.i.1.for.end.i.i_crit_edge ], [ %add.ptr.i.i.i.2, %do.body.i.i.2.for.end.i.i_crit_edge ], [ %add.ptr.i.i.i.3, %do.body.i.i.3.for.end.i.i_crit_edge ], [ %add.ptr.i.i.i.4, %do.body.i.i.4.for.end.i.i_crit_edge ], [ %add.ptr.i.i.i.5, %do.body.i.i.5.for.end.i.i_crit_edge ], [ %add.ptr.i.i.i.6, %do.body.i.i.6.for.end.i.i_crit_edge ], [ %add.ptr.i.i.i.7, %do.body.i.i.7 ]
  %sub.i.i = sub i32 %len.addr.022.i.i, %spec.store.select.i.i
  %cmp.i.i = icmp eq i32 %sub.i.i, 0
  br i1 %cmp.i.i, label %emit_nops.exit.loopexit.i, label %for.end.i.i.while.body.i.i_crit_edge

for.end.i.i.while.body.i.i_crit_edge:             ; preds = %for.end.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %while.body.i.i

emit_nops.exit.loopexit.i:                        ; preds = %for.end.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %.pre.i = ptrtoint i8* %add.ptr.i.i.i.lcssa to i64
  br label %emit_align.exit

emit_align.exit:                                  ; preds = %if.then.i.emit_align.exit_crit_edge, %if.end93.emit_align.exit_crit_edge, %emit_nops.exit.loopexit.i
  %prog.sroa.0.0.i = phi i64 [ %61, %if.end93.emit_align.exit_crit_edge ], [ %.pre.i, %emit_nops.exit.loopexit.i ], [ %61, %if.then.i.emit_align.exit_crit_edge ]
  %70 = bitcast i8** %prog to i64*
  %71 = ptrtoint i64* %70 to i64
  call void @__asan_store8_noabort(i64 %71)
  store i64 %prog.sroa.0.0.i, i64* %70, align 8
  %sub.ptr.rhs.cast = ptrtoint i8* %add.ptr.i158 to i64
  %sub.ptr.sub = sub i64 %prog.sroa.0.0.i, %sub.ptr.rhs.cast
  %idx.ext = zext i32 %jg_bytes.0 to i64
  %idx.neg = sub nsw i64 0, %idx.ext
  %add.ptr = getelementptr i8, i8* %add.ptr.i158, i64 %idx.neg
  call void @__sanitizer_cov_trace_const_cmp4(i32 1, i32 %jg_bytes.0)
  %cond = icmp eq i32 %jg_bytes.0, 1
  br i1 %cond, label %if.then.i154, label %if.else5.i

if.then.i154:                                     ; preds = %emit_align.exit
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %conv.i = trunc i64 %sub.ptr.sub to i8
  %72 = ptrtoint i8* %add.ptr to i64
  call void @__asan_store1_noabort(i64 %72)
  store i8 %conv.i, i8* %add.ptr, align 1
  br label %emit_code.exit

if.else5.i:                                       ; preds = %emit_align.exit
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %conv94 = trunc i64 %sub.ptr.sub to i32
  %73 = bitcast i8* %add.ptr to i32*
  %74 = ptrtoint i32* %73 to i64
  call void @__asan_store4_noabort(i64 %74)
  store i32 %conv94, i32* %73, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  br label %emit_code.exit

emit_code.exit:                                   ; preds = %if.then.i154, %if.else5.i
  %add97 = add i32 %add40, 1
  %call98 = call fastcc i32 @emit_bpf_dispatcher(i8** nonnull %prog, i32 %add97, i32 %b, i64* %progs) #14
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %call98)
  %tobool99 = icmp eq i32 %call98, 0
  br i1 %tobool99, label %if.end101, label %emit_code.exit.cleanup_crit_edge

emit_code.exit.cleanup_crit_edge:                 ; preds = %emit_code.exit
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %cleanup

if.end101:                                        ; preds = %emit_code.exit
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %75 = ptrtoint i64* %70 to i64
  call void @__asan_load8_noabort(i64 %75)
  %76 = load i64, i64* %70, align 8
  %77 = bitcast i8** %pprog to i64*
  %78 = ptrtoint i64* %77 to i64
  call void @__asan_store8_noabort(i64 %78)
  store i64 %76, i64* %77, align 8
  br label %cleanup

cleanup:                                          ; preds = %emit_code.exit.cleanup_crit_edge, %if.end88.cleanup_crit_edge, %if.end32.cleanup_crit_edge, %do.body.cleanup_crit_edge, %emit_fallback_jump.exit, %emit_cond_near_jump.exit, %if.end101, %if.end31
  %retval.0 = phi i32 [ 0, %if.end31 ], [ 0, %if.end101 ], [ -1, %do.body.cleanup_crit_edge ], [ -22, %emit_cond_near_jump.exit ], [ -34, %emit_fallback_jump.exit ], [ -1, %if.end32.cleanup_crit_edge ], [ %call90, %if.end88.cleanup_crit_edge ], [ %call98, %emit_code.exit.cleanup_crit_edge ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0) #15
  ret i32 %retval.0

do.body.i.i.1:                                    ; preds = %while.body.i.i
  call void @__asan_load8_noabort(i64 ptrtoint (i8*** @ideal_nops to i64))
  %79 = load i8**, i8*** @ideal_nops, align 8
  %arrayidx.i.i.1 = getelementptr i8*, i8** %79, i64 %idxprom.i.i
  %80 = ptrtoint i8** %arrayidx.i.i.1 to i64
  call void @__asan_load8_noabort(i64 %80)
  %81 = load i8*, i8** %arrayidx.i.i.1, align 8
  %arrayidx4.i.i.1 = getelementptr i8, i8* %81, i64 1
  %82 = ptrtoint i8* %arrayidx4.i.i.1 to i64
  call void @__asan_load1_noabort(i64 %82)
  %83 = load i8, i8* %arrayidx4.i.i.1, align 1
  %84 = ptrtoint i8* %add.ptr.i.i.i to i64
  call void @__asan_store1_noabort(i64 %84)
  store i8 %83, i8* %add.ptr.i.i.i, align 1
  %add.ptr.i.i.i.1 = getelementptr i8, i8* %prog.023.i.i, i64 2
  call void @__sanitizer_cov_trace_const_cmp4(i32 2, i32 %spec.store.select.i.i)
  %cmp2.i.i.1 = icmp eq i32 %spec.store.select.i.i, 2
  br i1 %cmp2.i.i.1, label %do.body.i.i.1.for.end.i.i_crit_edge, label %do.body.i.i.2

do.body.i.i.1.for.end.i.i_crit_edge:              ; preds = %do.body.i.i.1
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.end.i.i

do.body.i.i.2:                                    ; preds = %do.body.i.i.1
  call void @__asan_load8_noabort(i64 ptrtoint (i8*** @ideal_nops to i64))
  %85 = load i8**, i8*** @ideal_nops, align 8
  %arrayidx.i.i.2 = getelementptr i8*, i8** %85, i64 %idxprom.i.i
  %86 = ptrtoint i8** %arrayidx.i.i.2 to i64
  call void @__asan_load8_noabort(i64 %86)
  %87 = load i8*, i8** %arrayidx.i.i.2, align 8
  %arrayidx4.i.i.2 = getelementptr i8, i8* %87, i64 2
  %88 = ptrtoint i8* %arrayidx4.i.i.2 to i64
  call void @__asan_load1_noabort(i64 %88)
  %89 = load i8, i8* %arrayidx4.i.i.2, align 1
  %90 = ptrtoint i8* %add.ptr.i.i.i.1 to i64
  call void @__asan_store1_noabort(i64 %90)
  store i8 %89, i8* %add.ptr.i.i.i.1, align 1
  %add.ptr.i.i.i.2 = getelementptr i8, i8* %prog.023.i.i, i64 3
  call void @__sanitizer_cov_trace_const_cmp4(i32 3, i32 %spec.store.select.i.i)
  %cmp2.i.i.2 = icmp ugt i32 %spec.store.select.i.i, 3
  br i1 %cmp2.i.i.2, label %do.body.i.i.3, label %do.body.i.i.2.for.end.i.i_crit_edge

do.body.i.i.2.for.end.i.i_crit_edge:              ; preds = %do.body.i.i.2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.end.i.i

do.body.i.i.3:                                    ; preds = %do.body.i.i.2
  call void @__asan_load8_noabort(i64 ptrtoint (i8*** @ideal_nops to i64))
  %91 = load i8**, i8*** @ideal_nops, align 8
  %arrayidx.i.i.3 = getelementptr i8*, i8** %91, i64 %idxprom.i.i
  %92 = ptrtoint i8** %arrayidx.i.i.3 to i64
  call void @__asan_load8_noabort(i64 %92)
  %93 = load i8*, i8** %arrayidx.i.i.3, align 8
  %arrayidx4.i.i.3 = getelementptr i8, i8* %93, i64 3
  %94 = ptrtoint i8* %arrayidx4.i.i.3 to i64
  call void @__asan_load1_noabort(i64 %94)
  %95 = load i8, i8* %arrayidx4.i.i.3, align 1
  %96 = ptrtoint i8* %add.ptr.i.i.i.2 to i64
  call void @__asan_store1_noabort(i64 %96)
  store i8 %95, i8* %add.ptr.i.i.i.2, align 1
  %add.ptr.i.i.i.3 = getelementptr i8, i8* %prog.023.i.i, i64 4
  call void @__sanitizer_cov_trace_const_cmp4(i32 4, i32 %spec.store.select.i.i)
  %cmp2.i.i.3 = icmp eq i32 %spec.store.select.i.i, 4
  br i1 %cmp2.i.i.3, label %do.body.i.i.3.for.end.i.i_crit_edge, label %do.body.i.i.4

do.body.i.i.3.for.end.i.i_crit_edge:              ; preds = %do.body.i.i.3
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.end.i.i

do.body.i.i.4:                                    ; preds = %do.body.i.i.3
  call void @__asan_load8_noabort(i64 ptrtoint (i8*** @ideal_nops to i64))
  %97 = load i8**, i8*** @ideal_nops, align 8
  %arrayidx.i.i.4 = getelementptr i8*, i8** %97, i64 %idxprom.i.i
  %98 = ptrtoint i8** %arrayidx.i.i.4 to i64
  call void @__asan_load8_noabort(i64 %98)
  %99 = load i8*, i8** %arrayidx.i.i.4, align 8
  %arrayidx4.i.i.4 = getelementptr i8, i8* %99, i64 4
  %100 = ptrtoint i8* %arrayidx4.i.i.4 to i64
  call void @__asan_load1_noabort(i64 %100)
  %101 = load i8, i8* %arrayidx4.i.i.4, align 1
  %102 = ptrtoint i8* %add.ptr.i.i.i.3 to i64
  call void @__asan_store1_noabort(i64 %102)
  store i8 %101, i8* %add.ptr.i.i.i.3, align 1
  %add.ptr.i.i.i.4 = getelementptr i8, i8* %prog.023.i.i, i64 5
  call void @__sanitizer_cov_trace_const_cmp4(i32 5, i32 %spec.store.select.i.i)
  %cmp2.i.i.4 = icmp ugt i32 %spec.store.select.i.i, 5
  br i1 %cmp2.i.i.4, label %do.body.i.i.5, label %do.body.i.i.4.for.end.i.i_crit_edge

do.body.i.i.4.for.end.i.i_crit_edge:              ; preds = %do.body.i.i.4
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.end.i.i

do.body.i.i.5:                                    ; preds = %do.body.i.i.4
  call void @__asan_load8_noabort(i64 ptrtoint (i8*** @ideal_nops to i64))
  %103 = load i8**, i8*** @ideal_nops, align 8
  %arrayidx.i.i.5 = getelementptr i8*, i8** %103, i64 %idxprom.i.i
  %104 = ptrtoint i8** %arrayidx.i.i.5 to i64
  call void @__asan_load8_noabort(i64 %104)
  %105 = load i8*, i8** %arrayidx.i.i.5, align 8
  %arrayidx4.i.i.5 = getelementptr i8, i8* %105, i64 5
  %106 = ptrtoint i8* %arrayidx4.i.i.5 to i64
  call void @__asan_load1_noabort(i64 %106)
  %107 = load i8, i8* %arrayidx4.i.i.5, align 1
  %108 = ptrtoint i8* %add.ptr.i.i.i.4 to i64
  call void @__asan_store1_noabort(i64 %108)
  store i8 %107, i8* %add.ptr.i.i.i.4, align 1
  %add.ptr.i.i.i.5 = getelementptr i8, i8* %prog.023.i.i, i64 6
  call void @__sanitizer_cov_trace_const_cmp4(i32 6, i32 %spec.store.select.i.i)
  %cmp2.i.i.5 = icmp eq i32 %spec.store.select.i.i, 6
  br i1 %cmp2.i.i.5, label %do.body.i.i.5.for.end.i.i_crit_edge, label %do.body.i.i.6

do.body.i.i.5.for.end.i.i_crit_edge:              ; preds = %do.body.i.i.5
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.end.i.i

do.body.i.i.6:                                    ; preds = %do.body.i.i.5
  call void @__asan_load8_noabort(i64 ptrtoint (i8*** @ideal_nops to i64))
  %109 = load i8**, i8*** @ideal_nops, align 8
  %arrayidx.i.i.6 = getelementptr i8*, i8** %109, i64 %idxprom.i.i
  %110 = ptrtoint i8** %arrayidx.i.i.6 to i64
  call void @__asan_load8_noabort(i64 %110)
  %111 = load i8*, i8** %arrayidx.i.i.6, align 8
  %arrayidx4.i.i.6 = getelementptr i8, i8* %111, i64 6
  %112 = ptrtoint i8* %arrayidx4.i.i.6 to i64
  call void @__asan_load1_noabort(i64 %112)
  %113 = load i8, i8* %arrayidx4.i.i.6, align 1
  %114 = ptrtoint i8* %add.ptr.i.i.i.5 to i64
  call void @__asan_store1_noabort(i64 %114)
  store i8 %113, i8* %add.ptr.i.i.i.5, align 1
  %add.ptr.i.i.i.6 = getelementptr i8, i8* %prog.023.i.i, i64 7
  call void @__sanitizer_cov_trace_const_cmp4(i32 7, i32 %spec.store.select.i.i)
  %cmp2.i.i.6 = icmp ugt i32 %spec.store.select.i.i, 7
  br i1 %cmp2.i.i.6, label %do.body.i.i.7, label %do.body.i.i.6.for.end.i.i_crit_edge

do.body.i.i.6.for.end.i.i_crit_edge:              ; preds = %do.body.i.i.6
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.end.i.i

do.body.i.i.7:                                    ; preds = %do.body.i.i.6
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  call void @__asan_load8_noabort(i64 ptrtoint (i8*** @ideal_nops to i64))
  %115 = load i8**, i8*** @ideal_nops, align 8
  %arrayidx.i.i.7 = getelementptr i8*, i8** %115, i64 %idxprom.i.i
  %116 = ptrtoint i8** %arrayidx.i.i.7 to i64
  call void @__asan_load8_noabort(i64 %116)
  %117 = load i8*, i8** %arrayidx.i.i.7, align 8
  %arrayidx4.i.i.7 = getelementptr i8, i8* %117, i64 7
  %118 = ptrtoint i8* %arrayidx4.i.i.7 to i64
  call void @__asan_load1_noabort(i64 %118)
  %119 = load i8, i8* %arrayidx4.i.i.7, align 1
  %120 = ptrtoint i8* %add.ptr.i.i.i.6 to i64
  call void @__asan_store1_noabort(i64 %120)
  store i8 %119, i8* %add.ptr.i.i.i.6, align 1
  %add.ptr.i.i.i.7 = getelementptr i8, i8* %prog.023.i.i, i64 8
  br label %for.end.i.i
}

; Function Attrs: noredzone nounwind sanitize_address sspstrong
define dso_local %struct.bpf_prog* @bpf_int_jit_compile(%struct.bpf_prog* %prog) local_unnamed_addr #0 {
entry:
  %temp.i = alloca [192 x i8], align 16
  %prog.i = alloca i8*, align 8
  %image = alloca i8*, align 8
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %0 = bitcast i8** %image to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #15
  %1 = ptrtoint i8** %image to i64
  call void @__asan_store8_noabort(i64 %1)
  store i8* null, i8** %image, align 8
  %jit_requested = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %prog, i64 0, i32 1
  %2 = ptrtoint i16* %jit_requested to i64
  call void @__asan_load2_noabort(i64 %2)
  %bf.load = load i16, i16* %jit_requested, align 2
  %bf.clear = and i16 %bf.load, 2
  call void @__sanitizer_cov_trace_const_cmp2(i16 0, i16 %bf.clear)
  %tobool = icmp eq i16 %bf.clear, 0
  br i1 %tobool, label %entry.cleanup129_crit_edge, label %if.end

entry.cleanup129_crit_edge:                       ; preds = %entry
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %cleanup129

if.end:                                           ; preds = %entry
  %call = tail call %struct.bpf_prog* @bpf_jit_blind_constants(%struct.bpf_prog* %prog) #13
  %cmp.i = icmp ugt %struct.bpf_prog* %call, inttoptr (i64 -4096 to %struct.bpf_prog*)
  br i1 %cmp.i, label %if.end.cleanup129_crit_edge, label %if.end3

if.end.cleanup129_crit_edge:                      ; preds = %if.end
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %cleanup129

if.end3:                                          ; preds = %if.end
  %cmp = icmp eq %struct.bpf_prog* %call, %prog
  %aux = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %call, i64 0, i32 7
  %3 = ptrtoint %struct.bpf_prog_aux** %aux to i64
  call void @__asan_load8_noabort(i64 %3)
  %4 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %aux, align 8
  %jit_data6 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %4, i64 0, i32 23
  %5 = bitcast i8** %jit_data6 to %struct.x64_jit_data**
  %6 = ptrtoint %struct.x64_jit_data** %5 to i64
  call void @__asan_load8_noabort(i64 %6)
  %7 = load %struct.x64_jit_data*, %struct.x64_jit_data** %5, align 8
  %tobool7 = icmp eq %struct.x64_jit_data* %7, null
  br i1 %tobool7, label %if.then8, label %if.end3.if.end15_crit_edge

if.end3.if.end15_crit_edge:                       ; preds = %if.end3
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end15

if.then8:                                         ; preds = %if.end3
  call void @__asan_load8_noabort(i64 ptrtoint (%struct.kmem_cache** getelementptr inbounds ([3 x [14 x %struct.kmem_cache*]], [3 x [14 x %struct.kmem_cache*]]* @kmalloc_caches, i64 0, i64 0, i64 5) to i64))
  %8 = load %struct.kmem_cache*, %struct.kmem_cache** getelementptr inbounds ([3 x [14 x %struct.kmem_cache*]], [3 x [14 x %struct.kmem_cache*]]* @kmalloc_caches, i64 0, i64 0, i64 5), align 8
  %call8.i.i = tail call noalias i8* @kmem_cache_alloc_trace(%struct.kmem_cache* %8, i32 3520, i64 32) #13
  %ptrint.i.i = ptrtoint i8* %call8.i.i to i64
  %maskedptr.i.i = and i64 %ptrint.i.i, 7
  call void @__sanitizer_cov_trace_const_cmp8(i64 0, i64 %maskedptr.i.i)
  %maskcond.i.i = icmp eq i64 %maskedptr.i.i, 0
  tail call void @llvm.assume(i1 %maskcond.i.i) #15
  %tobool10 = icmp eq i8* %call8.i.i, null
  br i1 %tobool10, label %if.then8.out_crit_edge, label %if.end12

if.then8.out_crit_edge:                           ; preds = %if.then8
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %out

if.end12:                                         ; preds = %if.then8
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %9 = bitcast i8* %call8.i.i to %struct.x64_jit_data*
  %10 = ptrtoint %struct.bpf_prog_aux** %aux to i64
  call void @__asan_load8_noabort(i64 %10)
  %11 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %aux, align 8
  %jit_data14 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %11, i64 0, i32 23
  %12 = ptrtoint i8** %jit_data14 to i64
  call void @__asan_store8_noabort(i64 %12)
  store i8* %call8.i.i, i8** %jit_data14, align 8
  br label %if.end15

if.end15:                                         ; preds = %if.end3.if.end15_crit_edge, %if.end12
  %jit_data.0 = phi %struct.x64_jit_data* [ %7, %if.end3.if.end15_crit_edge ], [ %9, %if.end12 ]
  %addrs16 = getelementptr inbounds %struct.x64_jit_data, %struct.x64_jit_data* %jit_data.0, i64 0, i32 1
  %13 = ptrtoint i32** %addrs16 to i64
  call void @__asan_load8_noabort(i64 %13)
  %14 = load i32*, i32** %addrs16, align 8
  %tobool17 = icmp eq i32* %14, null
  br i1 %tobool17, label %if.end23, label %if.then18

if.then18:                                        ; preds = %if.end15
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %15 = getelementptr inbounds %struct.x64_jit_data, %struct.x64_jit_data* %jit_data.0, i64 0, i32 4, i32 0
  %16 = ptrtoint i32* %15 to i64
  call void @__asan_load4_noabort(i64 %16)
  %17 = load i32, i32* %15, align 4
  %proglen20 = getelementptr inbounds %struct.x64_jit_data, %struct.x64_jit_data* %jit_data.0, i64 0, i32 3
  %18 = ptrtoint i32* %proglen20 to i64
  call void @__asan_load4_noabort(i64 %18)
  %19 = load i32, i32* %proglen20, align 8
  %image21 = getelementptr inbounds %struct.x64_jit_data, %struct.x64_jit_data* %jit_data.0, i64 0, i32 2
  %20 = bitcast i8** %image21 to i64*
  %21 = ptrtoint i64* %20 to i64
  call void @__asan_load8_noabort(i64 %21)
  %22 = load i64, i64* %20, align 8
  %23 = bitcast i8** %image to i64*
  %24 = ptrtoint i64* %23 to i64
  call void @__asan_store8_noabort(i64 %24)
  store i64 %22, i64* %23, align 8
  %header22 = getelementptr inbounds %struct.x64_jit_data, %struct.x64_jit_data* %jit_data.0, i64 0, i32 0
  %25 = ptrtoint %struct.bpf_binary_header** %header22 to i64
  call void @__asan_load8_noabort(i64 %25)
  %26 = load %struct.bpf_binary_header*, %struct.bpf_binary_header** %header22, align 8
  br label %skip_init_addrs

if.end23:                                         ; preds = %if.end15
  %len = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %call, i64 0, i32 4
  %27 = ptrtoint i32* %len to i64
  call void @__asan_load4_noabort(i64 %27)
  %28 = load i32, i32* %len, align 4
  %add = add i32 %28, 1
  %conv = zext i32 %add to i64
  %call24 = tail call fastcc i8* @kmalloc_array(i64 %conv, i64 4, i32 3264) #14
  %29 = bitcast i8* %call24 to i32*
  %tobool25 = icmp eq i8* %call24, null
  br i1 %tobool25, label %if.end23.out_addrs_crit_edge, label %if.end23.for.body_crit_edge

if.end23.for.body_crit_edge:                      ; preds = %if.end23
  br label %for.body

if.end23.out_addrs_crit_edge:                     ; preds = %if.end23
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %out_addrs

for.body:                                         ; preds = %for.body.for.body_crit_edge, %if.end23.for.body_crit_edge
  %i.0412 = phi i32 [ %inc, %for.body.for.body_crit_edge ], [ 0, %if.end23.for.body_crit_edge ]
  %proglen.0411 = phi i32 [ %add31, %for.body.for.body_crit_edge ], [ 0, %if.end23.for.body_crit_edge ]
  %add31 = add i32 %proglen.0411, 64
  %idxprom = sext i32 %i.0412 to i64
  %arrayidx = getelementptr i32, i32* %29, i64 %idxprom
  %30 = ptrtoint i32* %arrayidx to i64
  call void @__asan_store4_noabort(i64 %30)
  store i32 %add31, i32* %arrayidx, align 4
  %inc = add i32 %i.0412, 1
  %31 = ptrtoint i32* %len to i64
  call void @__asan_load4_noabort(i64 %31)
  %32 = load i32, i32* %len, align 4
  %cmp29 = icmp ugt i32 %inc, %32
  br i1 %cmp29, label %for.body.skip_init_addrs_crit_edge, label %for.body.for.body_crit_edge

for.body.for.body_crit_edge:                      ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.body

for.body.skip_init_addrs_crit_edge:               ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %skip_init_addrs

skip_init_addrs:                                  ; preds = %for.body.skip_init_addrs_crit_edge, %if.then18
  %ctx.sroa.0.0 = phi i32 [ %17, %if.then18 ], [ %add31, %for.body.skip_init_addrs_crit_edge ]
  %oldproglen.0 = phi i32 [ %19, %if.then18 ], [ 0, %for.body.skip_init_addrs_crit_edge ]
  %extra_pass.0 = phi i1 [ true, %if.then18 ], [ false, %for.body.skip_init_addrs_crit_edge ]
  %addrs.0 = phi i32* [ %14, %if.then18 ], [ %29, %for.body.skip_init_addrs_crit_edge ]
  %header.0 = phi %struct.bpf_binary_header* [ %26, %if.then18 ], [ null, %for.body.skip_init_addrs_crit_edge ]
  %33 = ptrtoint i8** %image to i64
  call void @__asan_load8_noabort(i64 %33)
  %.pr403 = load i8*, i8** %image, align 8
  %arraydecay.i = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %call, i64 0, i32 11, i64 0
  %len.i = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %call, i64 0, i32 4
  %34 = getelementptr inbounds [192 x i8], [192 x i8]* %temp.i, i64 0, i64 0
  %35 = bitcast i8** %prog.i to i8*
  %type.i.i = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %call, i64 0, i32 2
  %add.ptr.i1864.i = getelementptr inbounds [192 x i8], [192 x i8]* %temp.i, i64 0, i64 5
  %add.ptr.i.i.i = getelementptr inbounds [192 x i8], [192 x i8]* %temp.i, i64 0, i64 6
  %36 = bitcast i8* %add.ptr.i.i.i to i32*
  %add.ptr.i83.i.i = getelementptr inbounds [192 x i8], [192 x i8]* %temp.i, i64 0, i64 9
  %37 = bitcast i8* %add.ptr.i83.i.i to i32*
  %add.ptr.i84.i.i = getelementptr inbounds [192 x i8], [192 x i8]* %temp.i, i64 0, i64 12
  %38 = bitcast i8* %add.ptr.i84.i.i to i32*
  %add.ptr.i82.i.i = getelementptr inbounds [192 x i8], [192 x i8]* %temp.i, i64 0, i64 16
  %add.ptr.i81.i.i = getelementptr inbounds [192 x i8], [192 x i8]* %temp.i, i64 0, i64 17
  %39 = bitcast i8* %add.ptr.i81.i.i to i16*
  %add.ptr.i80.i.i = getelementptr inbounds [192 x i8], [192 x i8]* %temp.i, i64 0, i64 19
  %40 = bitcast i8* %add.ptr.i80.i.i to i16*
  %add.ptr.i79.i.i = getelementptr inbounds [192 x i8], [192 x i8]* %temp.i, i64 0, i64 21
  %41 = bitcast i8* %add.ptr.i79.i.i to i16*
  %add.ptr.i78.i.i = getelementptr inbounds [192 x i8], [192 x i8]* %temp.i, i64 0, i64 23
  %42 = bitcast i8* %add.ptr.i78.i.i to i16*
  %add.ptr.i77.i.i = getelementptr inbounds [192 x i8], [192 x i8]* %temp.i, i64 0, i64 25
  %43 = bitcast i8** %prog.i to i64*
  %sub.ptr.rhs.cast.i = ptrtoint [192 x i8]* %temp.i to i64
  br label %for.body36

for.body36:                                       ; preds = %if.end75.for.body36_crit_edge, %skip_init_addrs
  %.pr409 = phi i8* [ %.pr403, %skip_init_addrs ], [ %.pr, %if.end75.for.body36_crit_edge ]
  %header.1408 = phi %struct.bpf_binary_header* [ %header.0, %skip_init_addrs ], [ %header.2, %if.end75.for.body36_crit_edge ]
  %pass.0407 = phi i32 [ 0, %skip_init_addrs ], [ %inc79, %if.end75.for.body36_crit_edge ]
  %oldproglen.1406 = phi i32 [ %oldproglen.0, %skip_init_addrs ], [ %proglen.0.lcssa.i, %if.end75.for.body36_crit_edge ]
  %ctx.sroa.0.1405 = phi i32 [ %ctx.sroa.0.0, %skip_init_addrs ], [ %ctx.sroa.0.4, %if.end75.for.body36_crit_edge ]
  %44 = ptrtoint i32* %len.i to i64
  call void @__asan_load4_noabort(i64 %44)
  %45 = load i32, i32* %len.i, align 4
  call void @llvm.lifetime.start.p0i8(i64 192, i8* nonnull %34) #15
  %46 = call i8* @memset(i8* %34, i32 170, i64 192)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %35) #15
  %47 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %47)
  store i8* %34, i8** %prog.i, align 8
  %48 = ptrtoint %struct.bpf_prog_aux** %aux to i64
  call void @__asan_load8_noabort(i64 %48)
  %49 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %aux, align 8
  %stack_depth.i = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %49, i64 0, i32 5
  %50 = ptrtoint i32* %stack_depth.i to i64
  call void @__asan_load4_noabort(i64 %50)
  %51 = load i32, i32* %stack_depth.i, align 8
  %52 = ptrtoint i32* %type.i.i to i64
  call void @__asan_load4_noabort(i64 %52)
  %53 = load i32, i32* %type.i.i, align 4
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %53)
  %cmp.i.i = icmp eq i32 %53, 0
  call void @__asan_load8_noabort(i64 ptrtoint (i8*** @ideal_nops to i64))
  %54 = load i8**, i8*** @ideal_nops, align 8
  %arrayidx.i.i = getelementptr i8*, i8** %54, i64 9
  %55 = ptrtoint i8** %arrayidx.i.i to i64
  call void @__asan_load8_noabort(i64 %55)
  %56 = load i8*, i8** %arrayidx.i.i, align 8
  %call.i.i241 = call i8* @memcpy(i8* nonnull %34, i8* %56, i64 5) #13
  %57 = ptrtoint i8* %add.ptr.i1864.i to i64
  call void @__asan_store1_noabort(i64 %57)
  store i8 85, i8* %add.ptr.i1864.i, align 1
  %58 = ptrtoint i32* %36 to i64
  call void @__asan_store4_noabort(i64 %58)
  store i32 15042888, i32* %36, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %59 = ptrtoint i32* %37 to i64
  call void @__asan_store4_noabort(i64 %59)
  store i32 15499592, i32* %37, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %sub.i.i = add i32 %51, -1
  %or.i.i242 = or i32 %sub.i.i, 7
  %add14.i.i = add i32 %or.i.i242, 1
  %60 = ptrtoint i32* %38 to i64
  call void @__asan_store4_noabort(i64 %60)
  store i32 %add14.i.i, i32* %38, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %61 = ptrtoint i8* %add.ptr.i82.i.i to i64
  call void @__asan_store1_noabort(i64 %61)
  store i8 83, i8* %add.ptr.i82.i.i, align 16
  %62 = ptrtoint i16* %39 to i64
  call void @__asan_store2_noabort(i64 %62)
  store i16 21825, i16* %39, align 2
  %63 = ptrtoint i16* %40 to i64
  call void @__asan_store2_noabort(i64 %63)
  store i16 22081, i16* %40, align 2
  %64 = ptrtoint i16* %41 to i64
  call void @__asan_store2_noabort(i64 %64)
  store i16 22337, i16* %41, align 2
  br i1 %cmp.i.i, label %for.body36.emit_prologue.exit.i_crit_edge, label %do.body41.i.i

for.body36.emit_prologue.exit.i_crit_edge:        ; preds = %for.body36
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit_prologue.exit.i

do.body41.i.i:                                    ; preds = %for.body36
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %65 = ptrtoint i16* %42 to i64
  call void @__asan_store2_noabort(i64 %65)
  store i16 106, i16* %42, align 2
  br label %emit_prologue.exit.i

emit_prologue.exit.i:                             ; preds = %for.body36.emit_prologue.exit.i_crit_edge, %do.body41.i.i
  %prog.0.i.i = phi i8* [ %add.ptr.i78.i.i, %for.body36.emit_prologue.exit.i_crit_edge ], [ %add.ptr.i77.i.i, %do.body41.i.i ]
  %66 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %66)
  store i8* %prog.0.i.i, i8** %prog.i, align 8
  %.cast.i = ptrtoint i8* %prog.0.i.i to i64
  %sub.ptr.sub.i = sub i64 %.cast.i, %sub.ptr.rhs.cast.i
  %conv.i = trunc i64 %sub.ptr.sub.i to i32
  %67 = ptrtoint i32* %addrs.0 to i64
  call void @__asan_store4_noabort(i64 %67)
  store i32 %conv.i, i32* %addrs.0, align 4
  call void @__sanitizer_cov_trace_const_cmp4(i32 1, i32 %45)
  %cmp2524.i = icmp slt i32 %45, 1
  br i1 %cmp2524.i, label %emit_prologue.exit.i.for.end.i_crit_edge, label %for.body.lr.ph.i

emit_prologue.exit.i.for.end.i_crit_edge:         ; preds = %emit_prologue.exit.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.end.i

for.body.lr.ph.i:                                 ; preds = %emit_prologue.exit.i
  %add.ptr1010.i = getelementptr i8, i8* %.pr409, i64 5
  %tobool1417.i = icmp eq i8* %.pr409, null
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc.i.for.body.i_crit_edge, %for.body.lr.ph.i
  %ctx.sroa.0.2 = phi i32 [ %ctx.sroa.0.1405, %for.body.lr.ph.i ], [ %ctx.sroa.0.3, %for.inc.i.for.body.i_crit_edge ]
  %proglen.02544.i = phi i32 [ 0, %for.body.lr.ph.i ], [ %.pre.i, %for.inc.i.for.body.i_crit_edge ]
  %excnt.02541.i = phi i32 [ 0, %for.body.lr.ph.i ], [ %excnt.2.i, %for.inc.i.for.body.i_crit_edge ]
  %i.02531.i = phi i32 [ 1, %for.body.lr.ph.i ], [ %inc1449.i, %for.inc.i.for.body.i_crit_edge ]
  %seen_exit.02528.i = phi i8 [ 0, %for.body.lr.ph.i ], [ %seen_exit.1.i, %for.inc.i.for.body.i_crit_edge ]
  %insn.02525.i = phi %struct.bpf_insn* [ %arraydecay.i, %for.body.lr.ph.i ], [ %incdec.ptr1450.i, %for.inc.i.for.body.i_crit_edge ]
  %imm.i = getelementptr inbounds %struct.bpf_insn, %struct.bpf_insn* %insn.02525.i, i64 0, i32 3
  %68 = ptrtoint i32* %imm.i to i64
  call void @__asan_load4_noabort(i64 %68)
  %69 = load i32, i32* %imm.i, align 4
  %dst_reg4.i = getelementptr inbounds %struct.bpf_insn, %struct.bpf_insn* %insn.02525.i, i64 0, i32 1
  %70 = ptrtoint i8* %dst_reg4.i to i64
  call void @__asan_load1_noabort(i64 %70)
  %bf.load.i = load i8, i8* %dst_reg4.i, align 1
  %bf.clear.i = and i8 %bf.load.i, 15
  %conv5.i = zext i8 %bf.clear.i to i32
  %bf.lshr.i = lshr i8 %bf.load.i, 4
  %conv8.i = zext i8 %bf.lshr.i to i32
  %code.i = getelementptr inbounds %struct.bpf_insn, %struct.bpf_insn* %insn.02525.i, i64 0, i32 0
  %71 = ptrtoint i8* %code.i to i64
  call void @__asan_load1_noabort(i64 %71)
  %72 = load i8, i8* %code.i, align 4
  %73 = zext i8 %72 to i64
  call void @__sanitizer_cov_trace_switch(i64 %73, i64* getelementptr inbounds ([121 x i64], [121 x i64]* @__sancov_gen_cov_switch_values.24, i32 0, i32 0))
  switch i8 %72, label %sw.default1402.i [
    i8 12, label %for.body.i.sw.bb.i_crit_edge
    i8 28, label %for.body.i.sw.bb.i_crit_edge776
    i8 92, label %for.body.i.sw.bb.i_crit_edge777
    i8 76, label %for.body.i.sw.bb.i_crit_edge778
    i8 -84, label %for.body.i.sw.bb.i_crit_edge779
    i8 15, label %for.body.i.sw.bb.i_crit_edge780
    i8 31, label %for.body.i.sw.bb.i_crit_edge781
    i8 95, label %for.body.i.sw.bb.i_crit_edge782
    i8 79, label %for.body.i.sw.bb.i_crit_edge783
    i8 -81, label %for.body.i.sw.bb.i_crit_edge784
    i8 -65, label %for.body.i.sw.bb47.i_crit_edge
    i8 -68, label %for.body.i.sw.bb47.i_crit_edge785
    i8 -124, label %for.body.i.sw.bb53.i_crit_edge
    i8 -121, label %for.body.i.sw.bb53.i_crit_edge786
    i8 4, label %for.body.i.sw.bb88.i_crit_edge
    i8 20, label %for.body.i.sw.bb88.i_crit_edge787
    i8 84, label %for.body.i.sw.bb88.i_crit_edge788
    i8 68, label %for.body.i.sw.bb88.i_crit_edge789
    i8 -92, label %for.body.i.sw.bb88.i_crit_edge790
    i8 7, label %for.body.i.sw.bb88.i_crit_edge791
    i8 23, label %for.body.i.sw.bb88.i_crit_edge792
    i8 87, label %for.body.i.sw.bb88.i_crit_edge793
    i8 71, label %for.body.i.sw.bb88.i_crit_edge794
    i8 -89, label %for.body.i.sw.bb88.i_crit_edge795
    i8 -73, label %for.body.i.sw.bb173.i_crit_edge
    i8 -76, label %for.body.i.sw.bb173.i_crit_edge796
    i8 24, label %sw.bb179.i
    i8 -100, label %for.body.i.do.body185.i_crit_edge
    i8 60, label %for.body.i.do.body185.i_crit_edge797
    i8 -108, label %for.body.i.do.body185.i_crit_edge798
    i8 52, label %for.body.i.do.body185.i_crit_edge799
    i8 -97, label %for.body.i.do.body185.i_crit_edge800
    i8 63, label %for.body.i.do.body185.i_crit_edge801
    i8 -105, label %for.body.i.do.body185.i_crit_edge802
    i8 55, label %for.body.i.do.body185.i_crit_edge803
    i8 36, label %for.body.i.sw.bb324.i_crit_edge
    i8 44, label %for.body.i.sw.bb324.i_crit_edge804
    i8 39, label %for.body.i.sw.bb324.i_crit_edge805
    i8 47, label %for.body.i.sw.bb324.i_crit_edge806
    i8 100, label %for.body.i.sw.bb443.i_crit_edge
    i8 116, label %for.body.i.sw.bb443.i_crit_edge807
    i8 -60, label %for.body.i.sw.bb443.i_crit_edge808
    i8 103, label %for.body.i.sw.bb443.i_crit_edge809
    i8 119, label %for.body.i.sw.bb443.i_crit_edge810
    i8 -57, label %for.body.i.sw.bb443.i_crit_edge811
    i8 108, label %for.body.i.sw.bb501.i_crit_edge
    i8 124, label %for.body.i.sw.bb501.i_crit_edge812
    i8 -52, label %for.body.i.sw.bb501.i_crit_edge813
    i8 111, label %for.body.i.sw.bb501.i_crit_edge814
    i8 127, label %for.body.i.sw.bb501.i_crit_edge815
    i8 -49, label %for.body.i.sw.bb501.i_crit_edge816
    i8 -36, label %sw.bb642.i
    i8 -44, label %sw.bb724.i
    i8 114, label %sw.bb766.i
    i8 106, label %sw.bb781.i
    i8 98, label %sw.bb796.i
    i8 122, label %do.body812.i
    i8 115, label %for.body.i.sw.bb866.i_crit_edge
    i8 107, label %for.body.i.sw.bb866.i_crit_edge817
    i8 99, label %for.body.i.sw.bb866.i_crit_edge818
    i8 123, label %for.body.i.sw.bb866.i_crit_edge819
    i8 113, label %for.body.i.sw.bb872.i_crit_edge
    i8 49, label %for.body.i.sw.bb872.i_crit_edge820
    i8 105, label %for.body.i.sw.bb872.i_crit_edge821
    i8 41, label %for.body.i.sw.bb872.i_crit_edge822
    i8 97, label %for.body.i.sw.bb872.i_crit_edge823
    i8 33, label %for.body.i.sw.bb872.i_crit_edge824
    i8 121, label %for.body.i.sw.bb872.i_crit_edge825
    i8 57, label %for.body.i.sw.bb872.i_crit_edge826
    i8 -61, label %sw.bb933.i
    i8 -37, label %do.body958.i
    i8 -123, label %sw.bb1002.i
    i8 -11, label %sw.bb1015.i
    i8 29, label %for.body.i.sw.bb1026.i_crit_edge
    i8 93, label %for.body.i.sw.bb1026.i_crit_edge827
    i8 45, label %for.body.i.sw.bb1026.i_crit_edge828
    i8 -83, label %for.body.i.sw.bb1026.i_crit_edge829
    i8 61, label %for.body.i.sw.bb1026.i_crit_edge830
    i8 -67, label %for.body.i.sw.bb1026.i_crit_edge831
    i8 109, label %for.body.i.sw.bb1026.i_crit_edge832
    i8 -51, label %for.body.i.sw.bb1026.i_crit_edge833
    i8 125, label %for.body.i.sw.bb1026.i_crit_edge834
    i8 -35, label %for.body.i.sw.bb1026.i_crit_edge835
    i8 30, label %for.body.i.sw.bb1026.i_crit_edge836
    i8 94, label %for.body.i.sw.bb1026.i_crit_edge837
    i8 46, label %for.body.i.sw.bb1026.i_crit_edge838
    i8 -82, label %for.body.i.sw.bb1026.i_crit_edge839
    i8 62, label %for.body.i.sw.bb1026.i_crit_edge840
    i8 -66, label %for.body.i.sw.bb1026.i_crit_edge841
    i8 110, label %for.body.i.sw.bb1026.i_crit_edge842
    i8 -50, label %for.body.i.sw.bb1026.i_crit_edge843
    i8 126, label %for.body.i.sw.bb1026.i_crit_edge844
    i8 -34, label %for.body.i.sw.bb1026.i_crit_edge845
    i8 77, label %for.body.i.sw.bb1065.i_crit_edge
    i8 78, label %for.body.i.sw.bb1065.i_crit_edge846
    i8 69, label %for.body.i.sw.bb1104.i_crit_edge
    i8 70, label %for.body.i.sw.bb1104.i_crit_edge847
    i8 21, label %for.body.i.sw.bb1147.i_crit_edge
    i8 85, label %for.body.i.sw.bb1147.i_crit_edge848
    i8 37, label %for.body.i.sw.bb1147.i_crit_edge849
    i8 -91, label %for.body.i.sw.bb1147.i_crit_edge850
    i8 53, label %for.body.i.sw.bb1147.i_crit_edge851
    i8 -75, label %for.body.i.sw.bb1147.i_crit_edge852
    i8 101, label %for.body.i.sw.bb1147.i_crit_edge853
    i8 -59, label %for.body.i.sw.bb1147.i_crit_edge854
    i8 117, label %for.body.i.sw.bb1147.i_crit_edge855
    i8 -43, label %for.body.i.sw.bb1147.i_crit_edge856
    i8 22, label %for.body.i.sw.bb1147.i_crit_edge857
    i8 86, label %for.body.i.sw.bb1147.i_crit_edge858
    i8 38, label %for.body.i.sw.bb1147.i_crit_edge859
    i8 -90, label %for.body.i.sw.bb1147.i_crit_edge860
    i8 54, label %for.body.i.sw.bb1147.i_crit_edge861
    i8 -74, label %for.body.i.sw.bb1147.i_crit_edge862
    i8 102, label %for.body.i.sw.bb1147.i_crit_edge863
    i8 -58, label %for.body.i.sw.bb1147.i_crit_edge864
    i8 118, label %for.body.i.sw.bb1147.i_crit_edge865
    i8 -42, label %for.body.i.sw.bb1147.i_crit_edge866
    i8 5, label %sw.bb1303.i
    i8 -107, label %sw.bb1355.i
  ]

for.body.i.sw.bb1147.i_crit_edge866:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1147.i

for.body.i.sw.bb1147.i_crit_edge865:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1147.i

for.body.i.sw.bb1147.i_crit_edge864:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1147.i

for.body.i.sw.bb1147.i_crit_edge863:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1147.i

for.body.i.sw.bb1147.i_crit_edge862:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1147.i

for.body.i.sw.bb1147.i_crit_edge861:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1147.i

for.body.i.sw.bb1147.i_crit_edge860:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1147.i

for.body.i.sw.bb1147.i_crit_edge859:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1147.i

for.body.i.sw.bb1147.i_crit_edge858:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1147.i

for.body.i.sw.bb1147.i_crit_edge857:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1147.i

for.body.i.sw.bb1147.i_crit_edge856:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1147.i

for.body.i.sw.bb1147.i_crit_edge855:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1147.i

for.body.i.sw.bb1147.i_crit_edge854:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1147.i

for.body.i.sw.bb1147.i_crit_edge853:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1147.i

for.body.i.sw.bb1147.i_crit_edge852:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1147.i

for.body.i.sw.bb1147.i_crit_edge851:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1147.i

for.body.i.sw.bb1147.i_crit_edge850:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1147.i

for.body.i.sw.bb1147.i_crit_edge849:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1147.i

for.body.i.sw.bb1147.i_crit_edge848:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1147.i

for.body.i.sw.bb1147.i_crit_edge:                 ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1147.i

for.body.i.sw.bb1104.i_crit_edge847:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1104.i

for.body.i.sw.bb1104.i_crit_edge:                 ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1104.i

for.body.i.sw.bb1065.i_crit_edge846:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1065.i

for.body.i.sw.bb1065.i_crit_edge:                 ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1065.i

for.body.i.sw.bb1026.i_crit_edge845:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1026.i

for.body.i.sw.bb1026.i_crit_edge844:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1026.i

for.body.i.sw.bb1026.i_crit_edge843:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1026.i

for.body.i.sw.bb1026.i_crit_edge842:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1026.i

for.body.i.sw.bb1026.i_crit_edge841:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1026.i

for.body.i.sw.bb1026.i_crit_edge840:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1026.i

for.body.i.sw.bb1026.i_crit_edge839:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1026.i

for.body.i.sw.bb1026.i_crit_edge838:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1026.i

for.body.i.sw.bb1026.i_crit_edge837:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1026.i

for.body.i.sw.bb1026.i_crit_edge836:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1026.i

for.body.i.sw.bb1026.i_crit_edge835:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1026.i

for.body.i.sw.bb1026.i_crit_edge834:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1026.i

for.body.i.sw.bb1026.i_crit_edge833:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1026.i

for.body.i.sw.bb1026.i_crit_edge832:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1026.i

for.body.i.sw.bb1026.i_crit_edge831:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1026.i

for.body.i.sw.bb1026.i_crit_edge830:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1026.i

for.body.i.sw.bb1026.i_crit_edge829:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1026.i

for.body.i.sw.bb1026.i_crit_edge828:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1026.i

for.body.i.sw.bb1026.i_crit_edge827:              ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1026.i

for.body.i.sw.bb1026.i_crit_edge:                 ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb1026.i

for.body.i.sw.bb872.i_crit_edge826:               ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb872.i

for.body.i.sw.bb872.i_crit_edge825:               ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb872.i

for.body.i.sw.bb872.i_crit_edge824:               ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb872.i

for.body.i.sw.bb872.i_crit_edge823:               ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb872.i

for.body.i.sw.bb872.i_crit_edge822:               ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb872.i

for.body.i.sw.bb872.i_crit_edge821:               ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb872.i

for.body.i.sw.bb872.i_crit_edge820:               ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb872.i

for.body.i.sw.bb872.i_crit_edge:                  ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb872.i

for.body.i.sw.bb866.i_crit_edge819:               ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb866.i

for.body.i.sw.bb866.i_crit_edge818:               ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb866.i

for.body.i.sw.bb866.i_crit_edge817:               ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb866.i

for.body.i.sw.bb866.i_crit_edge:                  ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb866.i

for.body.i.sw.bb501.i_crit_edge816:               ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb501.i

for.body.i.sw.bb501.i_crit_edge815:               ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb501.i

for.body.i.sw.bb501.i_crit_edge814:               ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb501.i

for.body.i.sw.bb501.i_crit_edge813:               ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb501.i

for.body.i.sw.bb501.i_crit_edge812:               ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb501.i

for.body.i.sw.bb501.i_crit_edge:                  ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb501.i

for.body.i.sw.bb443.i_crit_edge811:               ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb443.i

for.body.i.sw.bb443.i_crit_edge810:               ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb443.i

for.body.i.sw.bb443.i_crit_edge809:               ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb443.i

for.body.i.sw.bb443.i_crit_edge808:               ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb443.i

for.body.i.sw.bb443.i_crit_edge807:               ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb443.i

for.body.i.sw.bb443.i_crit_edge:                  ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb443.i

for.body.i.sw.bb324.i_crit_edge806:               ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb324.i

for.body.i.sw.bb324.i_crit_edge805:               ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb324.i

for.body.i.sw.bb324.i_crit_edge804:               ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb324.i

for.body.i.sw.bb324.i_crit_edge:                  ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb324.i

for.body.i.do.body185.i_crit_edge803:             ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body185.i

for.body.i.do.body185.i_crit_edge802:             ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body185.i

for.body.i.do.body185.i_crit_edge801:             ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body185.i

for.body.i.do.body185.i_crit_edge800:             ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body185.i

for.body.i.do.body185.i_crit_edge799:             ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body185.i

for.body.i.do.body185.i_crit_edge798:             ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body185.i

for.body.i.do.body185.i_crit_edge797:             ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body185.i

for.body.i.do.body185.i_crit_edge:                ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body185.i

for.body.i.sw.bb173.i_crit_edge796:               ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb173.i

for.body.i.sw.bb173.i_crit_edge:                  ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb173.i

for.body.i.sw.bb88.i_crit_edge795:                ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb88.i

for.body.i.sw.bb88.i_crit_edge794:                ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb88.i

for.body.i.sw.bb88.i_crit_edge793:                ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb88.i

for.body.i.sw.bb88.i_crit_edge792:                ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb88.i

for.body.i.sw.bb88.i_crit_edge791:                ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb88.i

for.body.i.sw.bb88.i_crit_edge790:                ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb88.i

for.body.i.sw.bb88.i_crit_edge789:                ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb88.i

for.body.i.sw.bb88.i_crit_edge788:                ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb88.i

for.body.i.sw.bb88.i_crit_edge787:                ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb88.i

for.body.i.sw.bb88.i_crit_edge:                   ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb88.i

for.body.i.sw.bb53.i_crit_edge786:                ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb53.i

for.body.i.sw.bb53.i_crit_edge:                   ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb53.i

for.body.i.sw.bb47.i_crit_edge785:                ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb47.i

for.body.i.sw.bb47.i_crit_edge:                   ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb47.i

for.body.i.sw.bb.i_crit_edge784:                  ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb.i

for.body.i.sw.bb.i_crit_edge783:                  ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb.i

for.body.i.sw.bb.i_crit_edge782:                  ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb.i

for.body.i.sw.bb.i_crit_edge781:                  ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb.i

for.body.i.sw.bb.i_crit_edge780:                  ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb.i

for.body.i.sw.bb.i_crit_edge779:                  ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb.i

for.body.i.sw.bb.i_crit_edge778:                  ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb.i

for.body.i.sw.bb.i_crit_edge777:                  ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb.i

for.body.i.sw.bb.i_crit_edge776:                  ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb.i

for.body.i.sw.bb.i_crit_edge:                     ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb.i

sw.bb.i:                                          ; preds = %for.body.i.sw.bb.i_crit_edge784, %for.body.i.sw.bb.i_crit_edge783, %for.body.i.sw.bb.i_crit_edge782, %for.body.i.sw.bb.i_crit_edge781, %for.body.i.sw.bb.i_crit_edge780, %for.body.i.sw.bb.i_crit_edge779, %for.body.i.sw.bb.i_crit_edge778, %for.body.i.sw.bb.i_crit_edge777, %for.body.i.sw.bb.i_crit_edge776, %for.body.i.sw.bb.i_crit_edge
  call void @__sanitizer_cov_trace_const_cmp1(i8 -80, i8 %72)
  %74 = icmp ult i8 %72, -80
  br i1 %74, label %switch.lookup, label %sw.bb.i.sw.epilog.i_crit_edge

sw.bb.i.sw.epilog.i_crit_edge:                    ; preds = %sw.bb.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.epilog.i

switch.lookup:                                    ; preds = %sw.bb.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %75 = lshr i8 %72, 4
  %76 = zext i8 %75 to i64
  %switch.gep = getelementptr inbounds [11 x i32], [11 x i32]* @switch.table.bpf_int_jit_compile, i64 0, i64 %76
  %77 = ptrtoint i32* %switch.gep to i64
  call void @__asan_load4_noabort(i64 %77)
  %switch.load = load i32, i32* %switch.gep, align 4
  br label %sw.epilog.i

sw.epilog.i:                                      ; preds = %sw.bb.i.sw.epilog.i_crit_edge, %switch.lookup
  %b2.0.i = phi i32 [ 0, %sw.bb.i.sw.epilog.i_crit_edge ], [ %switch.load, %switch.lookup ]
  %78 = and i8 %72, 7
  call void @__sanitizer_cov_trace_const_cmp1(i8 7, i8 %78)
  %cmp20.i = icmp eq i8 %78, 7
  br i1 %cmp20.i, label %do.body.i, label %if.else.i

do.body.i:                                        ; preds = %sw.epilog.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %79 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %79)
  %80 = load i8*, i8** %prog.i, align 8
  %shl.i.i.i = shl nuw nsw i32 1, %conv5.i
  %81 = and i32 %shl.i.i.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %81)
  %tobool.i.i.i = icmp ne i32 %81, 0
  %82 = zext i1 %tobool.i.i.i to i8
  %shl.i10.i.i = shl nuw nsw i32 1, %conv8.i
  %83 = and i32 %shl.i10.i.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %83)
  %tobool.i11.i.i = icmp eq i32 %83, 0
  %byte.addr.1.i.v.i = select i1 %tobool.i11.i.i, i8 72, i8 76
  %byte.addr.1.i.i = or i8 %byte.addr.1.i.v.i, %82
  %84 = ptrtoint i8* %80 to i64
  call void @__asan_store1_noabort(i64 %84)
  store i8 %byte.addr.1.i.i, i8* %80, align 1
  %add.ptr.i1865.i = getelementptr i8, i8* %80, i64 1
  %85 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %85)
  store i8* %add.ptr.i1865.i, i8** %prog.i, align 8
  br label %do.body38.i

if.else.i:                                        ; preds = %sw.epilog.i
  %shl.i.i = shl nuw nsw i32 1, %conv5.i
  %86 = and i32 %shl.i.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %86)
  %tobool.i.i243 = icmp ne i32 %86, 0
  %.pre2559.i = shl nuw nsw i32 1, %conv8.i
  %.pre2560.i = and i32 %.pre2559.i, 27552
  %tobool.i.not.i = xor i1 %tobool.i.i243, true
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %.pre2560.i)
  %tobool.i1867.i = icmp eq i32 %.pre2560.i, 0
  %or.cond.i = and i1 %tobool.i1867.i, %tobool.i.not.i
  br i1 %or.cond.i, label %if.else.i.do.body38.i_crit_edge, label %do.body30.i

if.else.i.do.body38.i_crit_edge:                  ; preds = %if.else.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body38.i

do.body30.i:                                      ; preds = %if.else.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %87 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %87)
  %88 = load i8*, i8** %prog.i, align 8
  %89 = zext i1 %tobool.i.i243 to i8
  %byte.addr.1.i1876.v.i = select i1 %tobool.i1867.i, i8 64, i8 68
  %byte.addr.1.i1876.i = or i8 %byte.addr.1.i1876.v.i, %89
  %90 = ptrtoint i8* %88 to i64
  call void @__asan_store1_noabort(i64 %90)
  store i8 %byte.addr.1.i1876.i, i8* %88, align 1
  %add.ptr.i1883.i = getelementptr i8, i8* %88, i64 1
  store i8* %add.ptr.i1883.i, i8** %prog.i, align 8
  br label %do.body38.i

do.body38.i:                                      ; preds = %if.else.i.do.body38.i_crit_edge, %do.body30.i, %do.body.i
  %91 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %91)
  %92 = load i8*, i8** %prog.i, align 8
  %idxprom.i.i = zext i8 %bf.clear.i to i64
  %arrayidx.i1887.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom.i.i
  %93 = ptrtoint i32* %arrayidx.i1887.i to i64
  call void @__asan_load4_noabort(i64 %93)
  %94 = load i32, i32* %arrayidx.i1887.i, align 4
  %add.i.i = add i32 %94, 192
  %idxprom1.i.i = zext i8 %bf.lshr.i to i64
  %arrayidx2.i.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom1.i.i
  %95 = ptrtoint i32* %arrayidx2.i.i to i64
  call void @__asan_load4_noabort(i64 %95)
  %96 = load i32, i32* %arrayidx2.i.i, align 4
  %shl.i1888.i = shl i32 %96, 3
  %add3.i.i = add i32 %add.i.i, %shl.i1888.i
  %conv41.i = shl i32 %add3.i.i, 8
  %add42.i = or i32 %conv41.i, %b2.0.i
  %conv4.i1930.i = trunc i32 %add42.i to i16
  %97 = bitcast i8* %92 to i16*
  %98 = ptrtoint i16* %97 to i64
  call void @__asan_store2_noabort(i64 %98)
  store i16 %conv4.i1930.i, i16* %97, align 2
  %add.ptr.i1931.i = getelementptr i8, i8* %92, i64 2
  store i8* %add.ptr.i1931.i, i8** %prog.i, align 8
  br label %sw.epilog1406.i

sw.bb47.i:                                        ; preds = %for.body.i.sw.bb47.i_crit_edge785, %for.body.i.sw.bb47.i_crit_edge
  %99 = and i8 %72, 7
  call void @__sanitizer_cov_trace_const_cmp1(i8 7, i8 %99)
  %cmp51.i = icmp eq i8 %99, 7
  %100 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %100)
  %101 = load i8*, i8** %prog.i, align 8
  br i1 %cmp51.i, label %do.body.i.i, label %if.else.i.i

do.body.i.i:                                      ; preds = %sw.bb47.i
  call void @__sanitizer_cov_trace_cmp1(i8 %bf.clear.i, i8 %bf.lshr.i)
  %cmp.i2004.i = icmp eq i8 %bf.clear.i, %bf.lshr.i
  br i1 %cmp.i2004.i, label %do.body.i.i.emit_mov_reg.exit.i_crit_edge, label %do.body2.i.i

do.body.i.i.emit_mov_reg.exit.i_crit_edge:        ; preds = %do.body.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit_mov_reg.exit.i

do.body2.i.i:                                     ; preds = %do.body.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %shl.i.i.i.i = shl nuw nsw i32 1, %conv5.i
  %102 = and i32 %shl.i.i.i.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %102)
  %tobool.i.i.i.i = icmp ne i32 %102, 0
  %103 = zext i1 %tobool.i.i.i.i to i32
  %shl.i10.i.i.i = shl nuw nsw i32 1, %conv8.i
  %104 = and i32 %shl.i10.i.i.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %104)
  %tobool.i11.i.i.i = icmp eq i32 %104, 0
  %byte.addr.1.i.v.i.i = select i1 %tobool.i11.i.i.i, i32 72, i32 76
  %idxprom.i62.i.i = zext i8 %bf.clear.i to i64
  %arrayidx.i63.i.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom.i62.i.i
  %105 = ptrtoint i32* %arrayidx.i63.i.i to i64
  call void @__asan_load4_noabort(i64 %105)
  %106 = load i32, i32* %arrayidx.i63.i.i, align 4
  %add.i64.i.i = add i32 %106, 192
  %idxprom1.i65.i.i = zext i8 %bf.lshr.i to i64
  %arrayidx2.i66.i.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom1.i65.i.i
  %107 = ptrtoint i32* %arrayidx2.i66.i.i to i64
  call void @__asan_load4_noabort(i64 %107)
  %108 = load i32, i32* %arrayidx2.i66.i.i, align 4
  %shl.i67.i.i = shl i32 %108, 3
  %add3.i68.i.i = add i32 %add.i64.i.i, %shl.i67.i.i
  %conv4.i2005.i = shl i32 %add3.i68.i.i, 16
  %shl.i2006.i = and i32 %conv4.i2005.i, 16711680
  %byte.addr.1.i.i.i = or i32 %byte.addr.1.i.v.i.i, %103
  %add.i2007.i = or i32 %byte.addr.1.i.i.i, %shl.i2006.i
  %add5.i.i = or i32 %add.i2007.i, 35072
  %109 = bitcast i8* %101 to i32*
  %110 = ptrtoint i32* %109 to i64
  call void @__asan_store4_noabort(i64 %110)
  store i32 %add5.i.i, i32* %109, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i61.i.i = getelementptr i8, i8* %101, i64 3
  br label %emit_mov_reg.exit.i

if.else.i.i:                                      ; preds = %sw.bb47.i
  %shl.i59.i.i = shl nuw nsw i32 1, %conv5.i
  %111 = and i32 %shl.i59.i.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %111)
  %tobool.i60.i.i = icmp ne i32 %111, 0
  %.pre.i.i = shl nuw nsw i32 1, %conv8.i
  %.pre70.i.i = and i32 %.pre.i.i, 27552
  %tobool.i60.not.i.i = xor i1 %tobool.i60.i.i, true
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %.pre70.i.i)
  %tobool.i.i2008.i = icmp eq i32 %.pre70.i.i, 0
  %or.cond.i.i = and i1 %tobool.i.i2008.i, %tobool.i60.not.i.i
  br i1 %or.cond.i.i, label %if.else.i.i.do.body23.i.i_crit_edge, label %do.body15.i.i

if.else.i.i.do.body23.i.i_crit_edge:              ; preds = %if.else.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body23.i.i

do.body15.i.i:                                    ; preds = %if.else.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %112 = zext i1 %tobool.i60.i.i to i8
  %byte.addr.1.i57.v.i.i = select i1 %tobool.i.i2008.i, i8 64, i8 68
  %byte.addr.1.i57.i.i = or i8 %byte.addr.1.i57.v.i.i, %112
  %113 = ptrtoint i8* %101 to i64
  call void @__asan_store1_noabort(i64 %113)
  store i8 %byte.addr.1.i57.i.i, i8* %101, align 1
  %add.ptr.i51.i.i = getelementptr i8, i8* %101, i64 1
  br label %do.body23.i.i

do.body23.i.i:                                    ; preds = %if.else.i.i.do.body23.i.i_crit_edge, %do.body15.i.i
  %prog.0.i2009.i = phi i8* [ %add.ptr.i51.i.i, %do.body15.i.i ], [ %101, %if.else.i.i.do.body23.i.i_crit_edge ]
  %idxprom.i.i.i = zext i8 %bf.clear.i to i64
  %arrayidx.i.i.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom.i.i.i
  %114 = ptrtoint i32* %arrayidx.i.i.i to i64
  call void @__asan_load4_noabort(i64 %114)
  %115 = load i32, i32* %arrayidx.i.i.i, align 4
  %add.i.i.i = add i32 %115, 192
  %idxprom1.i.i.i = zext i8 %bf.lshr.i to i64
  %arrayidx2.i.i.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom1.i.i.i
  %116 = ptrtoint i32* %arrayidx2.i.i.i to i64
  call void @__asan_load4_noabort(i64 %116)
  %117 = load i32, i32* %arrayidx2.i.i.i, align 4
  %shl.i.i2010.i = shl i32 %117, 3
  %add3.i.i.i = add i32 %add.i.i.i, %shl.i.i2010.i
  %add3.i.tr.i.i = trunc i32 %add3.i.i.i to i16
  %118 = shl i16 %add3.i.tr.i.i, 8
  %conv4.i.i.i = or i16 %118, 137
  %119 = bitcast i8* %prog.0.i2009.i to i16*
  %120 = ptrtoint i16* %119 to i64
  call void @__asan_store2_noabort(i64 %120)
  store i16 %conv4.i.i.i, i16* %119, align 2
  %add.ptr.i.i2011.i = getelementptr i8, i8* %prog.0.i2009.i, i64 2
  br label %emit_mov_reg.exit.i

emit_mov_reg.exit.i:                              ; preds = %do.body.i.i.emit_mov_reg.exit.i_crit_edge, %do.body23.i.i, %do.body2.i.i
  %prog.1.i.i = phi i8* [ %add.ptr.i61.i.i, %do.body2.i.i ], [ %101, %do.body.i.i.emit_mov_reg.exit.i_crit_edge ], [ %add.ptr.i.i2011.i, %do.body23.i.i ]
  %121 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %121)
  store i8* %prog.1.i.i, i8** %prog.i, align 8
  br label %sw.epilog1406.i

sw.bb53.i:                                        ; preds = %for.body.i.sw.bb53.i_crit_edge786, %for.body.i.sw.bb53.i_crit_edge
  %122 = and i8 %72, 7
  call void @__sanitizer_cov_trace_const_cmp1(i8 7, i8 %122)
  %cmp57.i = icmp eq i8 %122, 7
  br i1 %cmp57.i, label %do.body60.i, label %if.else67.i

do.body60.i:                                      ; preds = %sw.bb53.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %123 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %123)
  %124 = load i8*, i8** %prog.i, align 8
  %shl.i.i2012.i = shl nuw nsw i32 1, %conv5.i
  %125 = and i32 %shl.i.i2012.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %125)
  %tobool.i.i2013.i = icmp ne i32 %125, 0
  %126 = zext i1 %tobool.i.i2013.i to i8
  %spec.select.i2014.i = or i8 %126, 72
  %127 = ptrtoint i8* %124 to i64
  call void @__asan_store1_noabort(i64 %127)
  store i8 %spec.select.i2014.i, i8* %124, align 1
  %add.ptr.i2015.i = getelementptr i8, i8* %124, i64 1
  %128 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %128)
  store i8* %add.ptr.i2015.i, i8** %prog.i, align 8
  br label %do.body79.i

if.else67.i:                                      ; preds = %sw.bb53.i
  %shl.i2016.i = shl nuw nsw i32 1, %conv5.i
  %129 = and i32 %shl.i2016.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %129)
  %tobool.i2017.i = icmp eq i32 %129, 0
  br i1 %tobool.i2017.i, label %if.else67.i.do.body79.i_crit_edge, label %do.body70.i

if.else67.i.do.body79.i_crit_edge:                ; preds = %if.else67.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body79.i

do.body70.i:                                      ; preds = %if.else67.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %130 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %130)
  %131 = load i8*, i8** %prog.i, align 8
  %132 = ptrtoint i8* %131 to i64
  call void @__asan_store1_noabort(i64 %132)
  store i8 65, i8* %131, align 1
  %add.ptr.i2021.i = getelementptr i8, i8* %131, i64 1
  store i8* %add.ptr.i2021.i, i8** %prog.i, align 8
  br label %do.body79.i

do.body79.i:                                      ; preds = %if.else67.i.do.body79.i_crit_edge, %do.body70.i, %do.body60.i
  %133 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %133)
  %134 = load i8*, i8** %prog.i, align 8
  %idxprom.i2022.i = zext i8 %bf.clear.i to i64
  %arrayidx.i2023.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom.i2022.i
  %135 = ptrtoint i32* %arrayidx.i2023.i to i64
  call void @__asan_load4_noabort(i64 %135)
  %136 = load i32, i32* %arrayidx.i2023.i, align 4
  %.tr2490.i = trunc i32 %136 to i16
  %137 = shl i16 %.tr2490.i, 8
  %138 = add i16 %137, -10240
  %conv4.i2025.i = or i16 %138, 247
  %139 = bitcast i8* %134 to i16*
  %140 = ptrtoint i16* %139 to i64
  call void @__asan_store2_noabort(i64 %140)
  store i16 %conv4.i2025.i, i16* %139, align 2
  %add.ptr.i2026.i = getelementptr i8, i8* %134, i64 2
  store i8* %add.ptr.i2026.i, i8** %prog.i, align 8
  br label %sw.epilog1406.i

sw.bb88.i:                                        ; preds = %for.body.i.sw.bb88.i_crit_edge795, %for.body.i.sw.bb88.i_crit_edge794, %for.body.i.sw.bb88.i_crit_edge793, %for.body.i.sw.bb88.i_crit_edge792, %for.body.i.sw.bb88.i_crit_edge791, %for.body.i.sw.bb88.i_crit_edge790, %for.body.i.sw.bb88.i_crit_edge789, %for.body.i.sw.bb88.i_crit_edge788, %for.body.i.sw.bb88.i_crit_edge787, %for.body.i.sw.bb88.i_crit_edge
  %141 = and i8 %72, 7
  call void @__sanitizer_cov_trace_const_cmp1(i8 7, i8 %141)
  %cmp92.i = icmp eq i8 %141, 7
  br i1 %cmp92.i, label %do.body95.i, label %if.else102.i

do.body95.i:                                      ; preds = %sw.bb88.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %142 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %142)
  %143 = load i8*, i8** %prog.i, align 8
  %shl.i.i2027.i = shl nuw nsw i32 1, %conv5.i
  %144 = and i32 %shl.i.i2027.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %144)
  %tobool.i.i2028.i = icmp ne i32 %144, 0
  %145 = zext i1 %tobool.i.i2028.i to i8
  %spec.select.i2029.i = or i8 %145, 72
  %146 = ptrtoint i8* %143 to i64
  call void @__asan_store1_noabort(i64 %146)
  store i8 %spec.select.i2029.i, i8* %143, align 1
  %add.ptr.i2030.i = getelementptr i8, i8* %143, i64 1
  %147 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %147)
  store i8* %add.ptr.i2030.i, i8** %prog.i, align 8
  br label %if.end113.i

if.else102.i:                                     ; preds = %sw.bb88.i
  %shl.i2031.i = shl nuw nsw i32 1, %conv5.i
  %148 = and i32 %shl.i2031.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %148)
  %tobool.i2032.i = icmp eq i32 %148, 0
  br i1 %tobool.i2032.i, label %if.else102.i.if.end113.i_crit_edge, label %do.body105.i

if.else102.i.if.end113.i_crit_edge:               ; preds = %if.else102.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end113.i

do.body105.i:                                     ; preds = %if.else102.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %149 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %149)
  %150 = load i8*, i8** %prog.i, align 8
  %151 = ptrtoint i8* %150 to i64
  call void @__asan_store1_noabort(i64 %151)
  store i8 65, i8* %150, align 1
  %add.ptr.i2036.i = getelementptr i8, i8* %150, i64 1
  store i8* %add.ptr.i2036.i, i8** %prog.i, align 8
  br label %if.end113.i

if.end113.i:                                      ; preds = %if.else102.i.if.end113.i_crit_edge, %do.body105.i, %do.body95.i
  %152 = ptrtoint i8* %code.i to i64
  call void @__asan_load1_noabort(i64 %152)
  %153 = load i8, i8* %code.i, align 4
  %154 = lshr i8 %153, 4
  call void @__sanitizer_cov_trace_const_cmp1(i8 -80, i8 %153)
  %155 = icmp ult i8 %153, -80
  br i1 %155, label %switch.lookup624, label %if.end113.i.sw.epilog122.i_crit_edge

if.end113.i.sw.epilog122.i_crit_edge:             ; preds = %if.end113.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.epilog122.i

switch.lookup624:                                 ; preds = %if.end113.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %156 = zext i8 %154 to i64
  %switch.gep625 = getelementptr inbounds [11 x i8], [11 x i8]* @switch.table.bpf_int_jit_compile.20, i64 0, i64 %156
  %157 = ptrtoint i8* %switch.gep625 to i64
  call void @__asan_load1_noabort(i64 %157)
  %switch.load626 = load i8, i8* %switch.gep625, align 1
  %158 = zext i8 %154 to i64
  %switch.gep627 = getelementptr inbounds [11 x i8], [11 x i8]* @switch.table.bpf_int_jit_compile.21, i64 0, i64 %158
  %159 = ptrtoint i8* %switch.gep627 to i64
  call void @__asan_load1_noabort(i64 %159)
  %switch.load628 = load i8, i8* %switch.gep627, align 1
  br label %sw.epilog122.i

sw.epilog122.i:                                   ; preds = %if.end113.i.sw.epilog122.i_crit_edge, %switch.lookup624
  %b2.1.i = phi i8 [ 0, %if.end113.i.sw.epilog122.i_crit_edge ], [ %switch.load626, %switch.lookup624 ]
  %b3.0.i = phi i8 [ 0, %if.end113.i.sw.epilog122.i_crit_edge ], [ %switch.load628, %switch.lookup624 ]
  %value.off.i2037.i = add i32 %69, 128
  call void @__sanitizer_cov_trace_const_cmp4(i32 256, i32 %value.off.i2037.i)
  %160 = icmp ult i32 %value.off.i2037.i, 256
  br i1 %160, label %do.body125.i, label %if.else136.i

do.body125.i:                                     ; preds = %sw.epilog122.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %161 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %161)
  %162 = load i8*, i8** %prog.i, align 8
  %idxprom.i2043.i = zext i8 %bf.clear.i to i64
  %arrayidx.i2044.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom.i2043.i
  %163 = ptrtoint i32* %arrayidx.i2044.i to i64
  call void @__asan_load4_noabort(i64 %163)
  %164 = load i32, i32* %arrayidx.i2044.i, align 4
  %165 = trunc i32 %164 to i8
  %conv1.i2045.i = add i8 %b3.0.i, %165
  %conv127.i = zext i8 %conv1.i2045.i to i32
  %shl128.i = shl nuw nsw i32 %conv127.i, 8
  %shl130.i = shl nsw i32 %69, 16
  %add129.i = or i32 %shl130.i, %shl128.i
  %add131.i = or i32 %add129.i, 131
  %166 = bitcast i8* %162 to i32*
  %167 = ptrtoint i32* %166 to i64
  call void @__asan_store4_noabort(i64 %167)
  store i32 %add131.i, i32* %166, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i2046.i = getelementptr i8, i8* %162, i64 3
  %168 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %168)
  store i8* %add.ptr.i2046.i, i8** %prog.i, align 8
  br label %sw.epilog1406.i

if.else136.i:                                     ; preds = %sw.epilog122.i
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %bf.clear.i)
  %cmp.i2047.i = icmp eq i8 %bf.clear.i, 0
  %169 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %169)
  %170 = load i8*, i8** %prog.i, align 8
  br i1 %cmp.i2047.i, label %do.body140.i, label %do.body155.i

do.body140.i:                                     ; preds = %if.else136.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %171 = ptrtoint i8* %170 to i64
  call void @__asan_store1_noabort(i64 %171)
  store i8 %b2.1.i, i8* %170, align 1
  %add.ptr.i2048.i = getelementptr i8, i8* %170, i64 1
  %172 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %172)
  store i8* %add.ptr.i2048.i, i8** %prog.i, align 8
  %173 = bitcast i8* %add.ptr.i2048.i to i32*
  %174 = ptrtoint i32* %173 to i64
  call void @__asan_store4_noabort(i64 %174)
  store i32 %69, i32* %173, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i2049.i = getelementptr i8, i8* %170, i64 5
  %175 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %175)
  store i8* %add.ptr.i2049.i, i8** %prog.i, align 8
  br label %sw.epilog1406.i

do.body155.i:                                     ; preds = %if.else136.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %idxprom.i2050.i = zext i8 %bf.clear.i to i64
  %arrayidx.i2051.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom.i2050.i
  %176 = ptrtoint i32* %arrayidx.i2051.i to i64
  call void @__asan_load4_noabort(i64 %176)
  %177 = load i32, i32* %arrayidx.i2051.i, align 4
  %178 = trunc i32 %177 to i8
  %conv1.i2052.i = add i8 %b3.0.i, %178
  %conv157.i = zext i8 %conv1.i2052.i to i16
  %shl158.i = shl nuw i16 %conv157.i, 8
  %add159.i = or i16 %shl158.i, 129
  %179 = bitcast i8* %170 to i16*
  %180 = ptrtoint i16* %179 to i64
  call void @__asan_store2_noabort(i64 %180)
  store i16 %add159.i, i16* %179, align 2
  %add.ptr.i2054.i = getelementptr i8, i8* %170, i64 2
  %181 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %181)
  store i8* %add.ptr.i2054.i, i8** %prog.i, align 8
  %182 = bitcast i8* %add.ptr.i2054.i to i32*
  %183 = ptrtoint i32* %182 to i64
  call void @__asan_store4_noabort(i64 %183)
  store i32 %69, i32* %182, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i2056.i = getelementptr i8, i8* %170, i64 6
  %184 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %184)
  store i8* %add.ptr.i2056.i, i8** %prog.i, align 8
  br label %sw.epilog1406.i

sw.bb173.i:                                       ; preds = %for.body.i.sw.bb173.i_crit_edge796, %for.body.i.sw.bb173.i_crit_edge
  %185 = and i8 %72, 7
  call void @__sanitizer_cov_trace_const_cmp1(i8 7, i8 %185)
  %cmp177.i = icmp eq i8 %185, 7
  %186 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %186)
  %187 = load i8*, i8** %prog.i, align 8
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %69)
  %cmp.i2057.i = icmp slt i32 %69, 0
  %or.cond.i2058.i = and i1 %cmp.i2057.i, %cmp177.i
  br i1 %or.cond.i2058.i, label %if.then.i.i244, label %if.end.i.i

if.then.i.i244:                                   ; preds = %sw.bb173.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %shl.i.i.i2059.i = shl nuw nsw i32 1, %conv5.i
  %188 = and i32 %shl.i.i.i2059.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %188)
  %tobool.i.i.i2060.i = icmp ne i32 %188, 0
  %189 = zext i1 %tobool.i.i.i2060.i to i32
  %idxprom.i.i2061.i = zext i8 %bf.clear.i to i64
  %arrayidx.i.i2062.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom.i.i2061.i
  %190 = ptrtoint i32* %arrayidx.i.i2062.i to i64
  call void @__asan_load4_noabort(i64 %190)
  %191 = load i32, i32* %arrayidx.i.i2062.i, align 4
  %conv1.i.i.i = shl i32 %191, 16
  %conv4.i2063.i = add i32 %conv1.i.i.i, 12582912
  %shl5.i.i = and i32 %conv4.i2063.i, 16711680
  %add.i2064.i = or i32 %shl5.i.i, %189
  %add6.i.i = or i32 %add.i2064.i, 51016
  %192 = bitcast i8* %187 to i32*
  %193 = ptrtoint i32* %192 to i64
  call void @__asan_store4_noabort(i64 %193)
  store i32 %add6.i.i, i32* %192, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i112.i.i = getelementptr i8, i8* %187, i64 3
  %194 = bitcast i8* %add.ptr.i112.i.i to i32*
  %195 = ptrtoint i32* %194 to i64
  call void @__asan_store4_noabort(i64 %195)
  store i32 %69, i32* %194, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i111.i.i = getelementptr i8, i8* %187, i64 7
  br label %emit_mov_imm32.exit.i

if.end.i.i:                                       ; preds = %sw.bb173.i
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %69)
  %cmp16.i.i = icmp eq i32 %69, 0
  %shl.i110.i.i = shl nuw nsw i32 1, %conv5.i
  %196 = and i32 %shl.i110.i.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %196)
  %tobool.i.i2065.i = icmp ne i32 %196, 0
  br i1 %cmp16.i.i, label %if.then18.i.i, label %if.end39.i.i

if.then18.i.i:                                    ; preds = %if.end.i.i
  br i1 %tobool.i.i2065.i, label %do.body21.i.i, label %if.then18.i.i.if.end28.i.i_crit_edge

if.then18.i.i.if.end28.i.i_crit_edge:             ; preds = %if.then18.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end28.i.i

do.body21.i.i:                                    ; preds = %if.then18.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %197 = ptrtoint i8* %187 to i64
  call void @__asan_store1_noabort(i64 %197)
  store i8 69, i8* %187, align 1
  %add.ptr.i106.i.i = getelementptr i8, i8* %187, i64 1
  br label %if.end28.i.i

if.end28.i.i:                                     ; preds = %if.then18.i.i.if.end28.i.i_crit_edge, %do.body21.i.i
  %prog.0.i2066.i = phi i8* [ %add.ptr.i106.i.i, %do.body21.i.i ], [ %187, %if.then18.i.i.if.end28.i.i_crit_edge ]
  %idxprom.i103.i.i = zext i8 %bf.clear.i to i64
  %arrayidx.i104.i.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom.i103.i.i
  %198 = ptrtoint i32* %arrayidx.i104.i.i to i64
  call void @__asan_load4_noabort(i64 %198)
  %199 = load i32, i32* %arrayidx.i104.i.i, align 4
  %add.i.i2067.i = add i32 %199, 192
  %shl.i.i2068.i = shl i32 %199, 3
  %add3.i.i2069.i = add i32 %add.i.i2067.i, %shl.i.i2068.i
  %add3.i.tr.i2070.i = trunc i32 %add3.i.i2069.i to i16
  %200 = shl i16 %add3.i.tr.i2070.i, 8
  %conv4.i.i2071.i = or i16 %200, 49
  %201 = bitcast i8* %prog.0.i2066.i to i16*
  %202 = ptrtoint i16* %201 to i64
  call void @__asan_store2_noabort(i64 %202)
  store i16 %conv4.i.i2071.i, i16* %201, align 2
  %add.ptr.i102.i.i = getelementptr i8, i8* %prog.0.i2066.i, i64 2
  br label %emit_mov_imm32.exit.i

if.end39.i.i:                                     ; preds = %if.end.i.i
  br i1 %tobool.i.i2065.i, label %do.body42.i.i, label %if.end39.i.i.do.body51.i.i_crit_edge

if.end39.i.i.do.body51.i.i_crit_edge:             ; preds = %if.end39.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body51.i.i

do.body42.i.i:                                    ; preds = %if.end39.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %203 = ptrtoint i8* %187 to i64
  call void @__asan_store1_noabort(i64 %203)
  store i8 65, i8* %187, align 1
  %add.ptr.i98.i.i = getelementptr i8, i8* %187, i64 1
  br label %do.body51.i.i

do.body51.i.i:                                    ; preds = %if.end39.i.i.do.body51.i.i_crit_edge, %do.body42.i.i
  %prog.1.i2072.i = phi i8* [ %add.ptr.i98.i.i, %do.body42.i.i ], [ %187, %if.end39.i.i.do.body51.i.i_crit_edge ]
  %idxprom.i95.i.i = zext i8 %bf.clear.i to i64
  %arrayidx.i96.i.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom.i95.i.i
  %204 = ptrtoint i32* %arrayidx.i96.i.i to i64
  call void @__asan_load4_noabort(i64 %204)
  %205 = load i32, i32* %arrayidx.i96.i.i, align 4
  %206 = trunc i32 %205 to i8
  %conv1.i97.i.i = add i8 %206, -72
  %207 = ptrtoint i8* %prog.1.i2072.i to i64
  call void @__asan_store1_noabort(i64 %207)
  store i8 %conv1.i97.i.i, i8* %prog.1.i2072.i, align 1
  %add.ptr.i94.i.i = getelementptr i8, i8* %prog.1.i2072.i, i64 1
  %208 = bitcast i8* %add.ptr.i94.i.i to i32*
  %209 = ptrtoint i32* %208 to i64
  call void @__asan_store4_noabort(i64 %209)
  store i32 %69, i32* %208, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i.i2073.i = getelementptr i8, i8* %prog.1.i2072.i, i64 5
  br label %emit_mov_imm32.exit.i

emit_mov_imm32.exit.i:                            ; preds = %do.body51.i.i, %if.end28.i.i, %if.then.i.i244
  %prog.2.i.i = phi i8* [ %add.ptr.i111.i.i, %if.then.i.i244 ], [ %add.ptr.i102.i.i, %if.end28.i.i ], [ %add.ptr.i.i2073.i, %do.body51.i.i ]
  %210 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %210)
  store i8* %prog.2.i.i, i8** %prog.i, align 8
  br label %sw.epilog1406.i

sw.bb179.i:                                       ; preds = %for.body.i
  %imm181.i = getelementptr %struct.bpf_insn, %struct.bpf_insn* %insn.02525.i, i64 1, i32 3
  %211 = ptrtoint i32* %imm181.i to i64
  call void @__asan_load4_noabort(i64 %211)
  %212 = load i32, i32* %imm181.i, align 4
  %213 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %213)
  %214 = load i8*, i8** %prog.i, align 8
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %212)
  %215 = icmp eq i32 %212, 0
  br i1 %215, label %if.then.i2075.i, label %do.body.i2083.i

if.then.i2075.i:                                  ; preds = %sw.bb179.i
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %69)
  %cmp16.i.i.i = icmp eq i32 %69, 0
  %shl.i110.i.i.i = shl nuw nsw i32 1, %conv5.i
  %216 = and i32 %shl.i110.i.i.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %216)
  %tobool.i.i.i2074.i = icmp ne i32 %216, 0
  br i1 %cmp16.i.i.i, label %if.then18.i.i.i, label %if.end39.i.i.i

if.then18.i.i.i:                                  ; preds = %if.then.i2075.i
  br i1 %tobool.i.i.i2074.i, label %do.body21.i.i.i, label %if.then18.i.i.i.if.end28.i.i.i_crit_edge

if.then18.i.i.i.if.end28.i.i.i_crit_edge:         ; preds = %if.then18.i.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end28.i.i.i

do.body21.i.i.i:                                  ; preds = %if.then18.i.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %217 = ptrtoint i8* %214 to i64
  call void @__asan_store1_noabort(i64 %217)
  store i8 69, i8* %214, align 1
  %add.ptr.i106.i.i.i = getelementptr i8, i8* %214, i64 1
  br label %if.end28.i.i.i

if.end28.i.i.i:                                   ; preds = %if.then18.i.i.i.if.end28.i.i.i_crit_edge, %do.body21.i.i.i
  %prog.0.i.i.i = phi i8* [ %add.ptr.i106.i.i.i, %do.body21.i.i.i ], [ %214, %if.then18.i.i.i.if.end28.i.i.i_crit_edge ]
  %idxprom.i103.i.i.i = zext i8 %bf.clear.i to i64
  %arrayidx.i104.i.i.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom.i103.i.i.i
  %218 = ptrtoint i32* %arrayidx.i104.i.i.i to i64
  call void @__asan_load4_noabort(i64 %218)
  %219 = load i32, i32* %arrayidx.i104.i.i.i, align 4
  %add.i.i.i.i = add i32 %219, 192
  %shl.i.i.i2076.i = shl i32 %219, 3
  %add3.i.i.i.i = add i32 %add.i.i.i.i, %shl.i.i.i2076.i
  %add3.i.tr.i.i.i = trunc i32 %add3.i.i.i.i to i16
  %220 = shl i16 %add3.i.tr.i.i.i, 8
  %conv4.i.i.i.i = or i16 %220, 49
  %221 = bitcast i8* %prog.0.i.i.i to i16*
  %222 = ptrtoint i16* %221 to i64
  call void @__asan_store2_noabort(i64 %222)
  store i16 %conv4.i.i.i.i, i16* %221, align 2
  %add.ptr.i102.i.i.i = getelementptr i8, i8* %prog.0.i.i.i, i64 2
  br label %emit_mov_imm64.exit.i

if.end39.i.i.i:                                   ; preds = %if.then.i2075.i
  br i1 %tobool.i.i.i2074.i, label %do.body42.i.i.i, label %if.end39.i.i.i.do.body51.i.i.i_crit_edge

if.end39.i.i.i.do.body51.i.i.i_crit_edge:         ; preds = %if.end39.i.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body51.i.i.i

do.body42.i.i.i:                                  ; preds = %if.end39.i.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %223 = ptrtoint i8* %214 to i64
  call void @__asan_store1_noabort(i64 %223)
  store i8 65, i8* %214, align 1
  %add.ptr.i98.i.i.i = getelementptr i8, i8* %214, i64 1
  br label %do.body51.i.i.i

do.body51.i.i.i:                                  ; preds = %if.end39.i.i.i.do.body51.i.i.i_crit_edge, %do.body42.i.i.i
  %prog.1.i.i.i = phi i8* [ %add.ptr.i98.i.i.i, %do.body42.i.i.i ], [ %214, %if.end39.i.i.i.do.body51.i.i.i_crit_edge ]
  %idxprom.i95.i.i.i = zext i8 %bf.clear.i to i64
  %arrayidx.i96.i.i.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom.i95.i.i.i
  %224 = ptrtoint i32* %arrayidx.i96.i.i.i to i64
  call void @__asan_load4_noabort(i64 %224)
  %225 = load i32, i32* %arrayidx.i96.i.i.i, align 4
  %226 = trunc i32 %225 to i8
  %conv1.i97.i.i.i = add i8 %226, -72
  %227 = ptrtoint i8* %prog.1.i.i.i to i64
  call void @__asan_store1_noabort(i64 %227)
  store i8 %conv1.i97.i.i.i, i8* %prog.1.i.i.i, align 1
  %add.ptr.i94.i.i.i = getelementptr i8, i8* %prog.1.i.i.i, i64 1
  %228 = bitcast i8* %add.ptr.i94.i.i.i to i32*
  %229 = ptrtoint i32* %228 to i64
  call void @__asan_store4_noabort(i64 %229)
  store i32 %69, i32* %228, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i.i.i2077.i = getelementptr i8, i8* %prog.1.i.i.i, i64 5
  br label %emit_mov_imm64.exit.i

do.body.i2083.i:                                  ; preds = %sw.bb179.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %shl.i.i28.i.i = shl nuw nsw i32 1, %conv5.i
  %230 = and i32 %shl.i.i28.i.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %230)
  %tobool.i.i29.i.i = icmp ne i32 %230, 0
  %231 = zext i1 %tobool.i.i29.i.i to i32
  %idxprom.i.i2078.i = zext i8 %bf.clear.i to i64
  %arrayidx.i.i2079.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom.i.i2078.i
  %232 = ptrtoint i32* %arrayidx.i.i2079.i to i64
  call void @__asan_load4_noabort(i64 %232)
  %233 = load i32, i32* %arrayidx.i.i2079.i, align 4
  %conv1.i.i2080.i = shl i32 %233, 8
  %conv5.i.i = add i32 %conv1.i.i2080.i, 47104
  %spec.select.i.i.i = or i32 %conv5.i.i, %231
  %234 = trunc i32 %spec.select.i.i.i to i16
  %conv4.i.i2081.i = or i16 %234, 72
  %235 = bitcast i8* %214 to i16*
  %236 = ptrtoint i16* %235 to i64
  call void @__asan_store2_noabort(i64 %236)
  store i16 %conv4.i.i2081.i, i16* %235, align 2
  %add.ptr.i31.i.i = getelementptr i8, i8* %214, i64 2
  %237 = bitcast i8* %add.ptr.i31.i.i to i32*
  %238 = ptrtoint i32* %237 to i64
  call void @__asan_store4_noabort(i64 %238)
  store i32 %69, i32* %237, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i30.i.i = getelementptr i8, i8* %214, i64 6
  %239 = bitcast i8* %add.ptr.i30.i.i to i32*
  %240 = ptrtoint i32* %239 to i64
  call void @__asan_store4_noabort(i64 %240)
  store i32 %212, i32* %239, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i.i2082.i = getelementptr i8, i8* %214, i64 10
  br label %emit_mov_imm64.exit.i

emit_mov_imm64.exit.i:                            ; preds = %do.body.i2083.i, %do.body51.i.i.i, %if.end28.i.i.i
  %prog.sroa.0.0.in.i.i = phi i8* [ %add.ptr.i.i2082.i, %do.body.i2083.i ], [ %add.ptr.i102.i.i.i, %if.end28.i.i.i ], [ %add.ptr.i.i.i2077.i, %do.body51.i.i.i ]
  %prog.sroa.0.0.i.i = ptrtoint i8* %prog.sroa.0.0.in.i.i to i64
  %241 = ptrtoint i64* %43 to i64
  call void @__asan_store8_noabort(i64 %241)
  store i64 %prog.sroa.0.0.i.i, i64* %43, align 8
  %incdec.ptr.i = getelementptr %struct.bpf_insn, %struct.bpf_insn* %insn.02525.i, i64 1
  %inc.i = add i32 %i.02531.i, 1
  br label %sw.epilog1406.i

do.body185.i:                                     ; preds = %for.body.i.do.body185.i_crit_edge803, %for.body.i.do.body185.i_crit_edge802, %for.body.i.do.body185.i_crit_edge801, %for.body.i.do.body185.i_crit_edge800, %for.body.i.do.body185.i_crit_edge799, %for.body.i.do.body185.i_crit_edge798, %for.body.i.do.body185.i_crit_edge797, %for.body.i.do.body185.i_crit_edge
  %242 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %242)
  %243 = load i8*, i8** %prog.i, align 8
  %244 = ptrtoint i8* %243 to i64
  call void @__asan_store1_noabort(i64 %244)
  store i8 80, i8* %243, align 1
  %add.ptr.i2086.i = getelementptr i8, i8* %243, i64 1
  %245 = ptrtoint i8* %add.ptr.i2086.i to i64
  call void @__asan_store1_noabort(i64 %245)
  store i8 82, i8* %add.ptr.i2086.i, align 1
  %add.ptr.i2088.i = getelementptr i8, i8* %243, i64 2
  store i8* %add.ptr.i2088.i, i8** %prog.i, align 8
  %246 = ptrtoint i8* %code.i to i64
  call void @__asan_load1_noabort(i64 %246)
  %247 = load i8, i8* %code.i, align 4
  %248 = and i8 %247, 8
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %248)
  %cmp198.i = icmp eq i8 %248, 0
  br i1 %cmp198.i, label %do.body222.i, label %do.body201.i

do.body201.i:                                     ; preds = %do.body185.i
  call void @__sanitizer_cov_trace_const_cmp1(i8 13, i8 %bf.lshr.i)
  %cmp202.i = icmp eq i8 %bf.lshr.i, 13
  br i1 %cmp202.i, label %do.body201.i.do.body235.i_crit_edge, label %do.body205.i

do.body201.i.do.body235.i_crit_edge:              ; preds = %do.body201.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body235.i

do.body205.i:                                     ; preds = %do.body201.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %shl.i10.i2089.i = shl nuw nsw i32 1, %conv8.i
  %249 = and i32 %shl.i10.i2089.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %249)
  %tobool.i11.i2090.i = icmp eq i32 %249, 0
  %idxprom1.i2092.i = zext i8 %bf.lshr.i to i64
  %arrayidx2.i2093.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom1.i2092.i
  %250 = ptrtoint i32* %arrayidx2.i2093.i to i64
  call void @__asan_load4_noabort(i64 %250)
  %251 = load i32, i32* %arrayidx2.i2093.i, align 4
  %252 = shl i32 %251, 19
  %conv210.i = add i32 %252, 12779520
  %shl211.i = and i32 %conv210.i, 16449536
  %add208.i = select i1 %tobool.i11.i2090.i, i32 35145, i32 35149
  %add212.i = or i32 %shl211.i, %add208.i
  %253 = bitcast i8* %add.ptr.i2088.i to i32*
  %254 = ptrtoint i32* %253 to i64
  call void @__asan_store4_noabort(i64 %254)
  store i32 %add212.i, i32* %253, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i2097.i = getelementptr i8, i8* %243, i64 5
  %255 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %255)
  store i8* %add.ptr.i2097.i, i8** %prog.i, align 8
  br label %do.body235.i

do.body222.i:                                     ; preds = %do.body185.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %256 = bitcast i8* %add.ptr.i2088.i to i32*
  %257 = ptrtoint i32* %256 to i64
  call void @__asan_store4_noabort(i64 %257)
  store i32 12830537, i32* %256, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i2098.i = getelementptr i8, i8* %243, i64 5
  %258 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %258)
  store i8* %add.ptr.i2098.i, i8** %prog.i, align 8
  %259 = bitcast i8* %add.ptr.i2098.i to i32*
  %260 = ptrtoint i32* %259 to i64
  call void @__asan_store4_noabort(i64 %260)
  store i32 %69, i32* %259, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i2099.i = getelementptr i8, i8* %243, i64 9
  %261 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %261)
  store i8* %add.ptr.i2099.i, i8** %prog.i, align 8
  br label %do.body235.i

do.body235.i:                                     ; preds = %do.body201.i.do.body235.i_crit_edge, %do.body222.i, %do.body205.i
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %bf.clear.i)
  %cmp236.i = icmp eq i8 %bf.clear.i, 0
  br i1 %cmp236.i, label %do.body235.i.do.body254.i_crit_edge, label %do.body239.i

do.body235.i.do.body254.i_crit_edge:              ; preds = %do.body235.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body254.i

do.body239.i:                                     ; preds = %do.body235.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %262 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %262)
  %263 = load i8*, i8** %prog.i, align 8
  %shl.i10.i2100.i = shl nuw nsw i32 1, %conv5.i
  %264 = and i32 %shl.i10.i2100.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %264)
  %tobool.i11.i2101.i = icmp eq i32 %264, 0
  %idxprom1.i2103.i = zext i8 %bf.clear.i to i64
  %arrayidx2.i2104.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom1.i2103.i
  %265 = ptrtoint i32* %arrayidx2.i2104.i to i64
  call void @__asan_load4_noabort(i64 %265)
  %266 = load i32, i32* %arrayidx2.i2104.i, align 4
  %267 = shl i32 %266, 19
  %conv244.i = add i32 %267, 12582912
  %shl245.i = and i32 %conv244.i, 16252928
  %add242.i = select i1 %tobool.i11.i2101.i, i32 35144, i32 35148
  %add246.i = or i32 %shl245.i, %add242.i
  %268 = bitcast i8* %263 to i32*
  %269 = ptrtoint i32* %268 to i64
  call void @__asan_store4_noabort(i64 %269)
  store i32 %add246.i, i32* %268, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i2109.i = getelementptr i8, i8* %263, i64 3
  %270 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %270)
  store i8* %add.ptr.i2109.i, i8** %prog.i, align 8
  br label %do.body254.i

do.body254.i:                                     ; preds = %do.body235.i.do.body254.i_crit_edge, %do.body239.i
  %271 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %271)
  %272 = load i8*, i8** %prog.i, align 8
  %273 = bitcast i8* %272 to i16*
  %274 = ptrtoint i16* %273 to i64
  call void @__asan_store2_noabort(i64 %274)
  store i16 -11727, i16* %273, align 2
  %add.ptr.i2110.i = getelementptr i8, i8* %272, i64 2
  store i8* %add.ptr.i2110.i, i8** %prog.i, align 8
  %275 = ptrtoint i8* %code.i to i64
  call void @__asan_load1_noabort(i64 %275)
  %276 = load i8, i8* %code.i, align 4
  %277 = and i8 %276, 7
  call void @__sanitizer_cov_trace_const_cmp1(i8 7, i8 %277)
  %cmp262.i = icmp eq i8 %277, 7
  %278 = bitcast i8* %add.ptr.i2110.i to i32*
  br i1 %cmp262.i, label %do.body265.i, label %do.body271.i

do.body265.i:                                     ; preds = %do.body254.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %279 = ptrtoint i32* %278 to i64
  call void @__asan_store4_noabort(i64 %279)
  store i32 15988553, i32* %278, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  br label %if.end276.i

do.body271.i:                                     ; preds = %do.body254.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %280 = ptrtoint i32* %278 to i64
  call void @__asan_store4_noabort(i64 %280)
  store i32 15988545, i32* %278, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  br label %if.end276.i

if.end276.i:                                      ; preds = %do.body271.i, %do.body265.i
  %storemerge.i = getelementptr i8, i8* %272, i64 5
  %281 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %281)
  store i8* %storemerge.i, i8** %prog.i, align 8
  %282 = ptrtoint i8* %code.i to i64
  call void @__asan_load1_noabort(i64 %282)
  %283 = load i8, i8* %code.i, align 4
  %284 = and i8 %283, -16
  call void @__sanitizer_cov_trace_const_cmp1(i8 -112, i8 %284)
  %cmp280.i = icmp eq i8 %284, -112
  %285 = bitcast i8* %storemerge.i to i32*
  br i1 %cmp280.i, label %do.body283.i, label %do.body289.i

do.body283.i:                                     ; preds = %if.end276.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %286 = ptrtoint i32* %285 to i64
  call void @__asan_store4_noabort(i64 %286)
  store i32 13863241, i32* %285, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  br label %do.body295.i

do.body289.i:                                     ; preds = %if.end276.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %287 = ptrtoint i32* %285 to i64
  call void @__asan_store4_noabort(i64 %287)
  store i32 12814665, i32* %285, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  br label %do.body295.i

do.body295.i:                                     ; preds = %do.body289.i, %do.body283.i
  %storemerge1854.i = getelementptr i8, i8* %272, i64 8
  %288 = ptrtoint i8* %storemerge1854.i to i64
  call void @__asan_store1_noabort(i64 %288)
  store i8 90, i8* %storemerge1854.i, align 1
  %add.ptr.i2138.i = getelementptr i8, i8* %272, i64 9
  %289 = ptrtoint i8* %add.ptr.i2138.i to i64
  call void @__asan_store1_noabort(i64 %289)
  store i8 88, i8* %add.ptr.i2138.i, align 1
  %add.ptr.i2148.i = getelementptr i8, i8* %272, i64 10
  %290 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %290)
  store i8* %add.ptr.i2148.i, i8** %prog.i, align 8
  call void @__sanitizer_cov_trace_const_cmp1(i8 13, i8 %bf.clear.i)
  %cmp306.i = icmp eq i8 %bf.clear.i, 13
  br i1 %cmp306.i, label %do.body295.i.sw.epilog1406.i_crit_edge, label %do.body309.i

do.body295.i.sw.epilog1406.i_crit_edge:           ; preds = %do.body295.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.epilog1406.i

do.body309.i:                                     ; preds = %do.body295.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %shl.i.i2159.i = shl nuw nsw i32 1, %conv5.i
  %291 = and i32 %shl.i.i2159.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %291)
  %tobool.i.i2160.i = icmp ne i32 %291, 0
  %292 = zext i1 %tobool.i.i2160.i to i32
  %idxprom.i2162.i = zext i8 %bf.clear.i to i64
  %arrayidx.i2163.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom.i2162.i
  %293 = ptrtoint i32* %arrayidx.i2163.i to i64
  call void @__asan_load4_noabort(i64 %293)
  %294 = load i32, i32* %arrayidx.i2163.i, align 4
  %conv4.i2166.i = shl i32 %294, 16
  %conv314.i = add i32 %conv4.i2166.i, 14155776
  %shl315.i = and i32 %conv314.i, 16711680
  %add312.i = or i32 %shl315.i, %292
  %add316.i = or i32 %add312.i, 35148
  %295 = bitcast i8* %add.ptr.i2148.i to i32*
  %296 = ptrtoint i32* %295 to i64
  call void @__asan_store4_noabort(i64 %296)
  store i32 %add316.i, i32* %295, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i2173.i = getelementptr i8, i8* %272, i64 13
  %297 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %297)
  store i8* %add.ptr.i2173.i, i8** %prog.i, align 8
  br label %sw.epilog1406.i

sw.bb324.i:                                       ; preds = %for.body.i.sw.bb324.i_crit_edge806, %for.body.i.sw.bb324.i_crit_edge805, %for.body.i.sw.bb324.i_crit_edge804, %for.body.i.sw.bb324.i_crit_edge
  %298 = and i8 %72, 7
  call void @__sanitizer_cov_trace_const_cmp1(i8 7, i8 %298)
  %cmp328.i = icmp eq i8 %298, 7
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %bf.clear.i)
  %cmp330.i = icmp ne i8 %bf.clear.i, 0
  %299 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %299)
  %300 = load i8*, i8** %prog.i, align 8
  br i1 %cmp330.i, label %if.end338.i, label %do.body348.thread2451.i

do.body348.thread2451.i:                          ; preds = %sw.bb324.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %301 = ptrtoint i8* %300 to i64
  call void @__asan_store1_noabort(i64 %301)
  store i8 82, i8* %300, align 1
  %add.ptr.i21842454.i = getelementptr i8, i8* %300, i64 1
  %302 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %302)
  store i8* %add.ptr.i21842454.i, i8** %prog.i, align 8
  br label %do.body352.i

if.end338.i:                                      ; preds = %sw.bb324.i
  %303 = ptrtoint i8* %300 to i64
  call void @__asan_store1_noabort(i64 %303)
  store i8 80, i8* %300, align 1
  %add.ptr.i2175.i = getelementptr i8, i8* %300, i64 1
  %304 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %304)
  store i8* %add.ptr.i2175.i, i8** %prog.i, align 8
  call void @__sanitizer_cov_trace_const_cmp1(i8 3, i8 %bf.clear.i)
  %cmp339.i = icmp eq i8 %bf.clear.i, 3
  br i1 %cmp339.i, label %if.end338.i.do.body352.i_crit_edge, label %do.body348.i

if.end338.i.do.body352.i_crit_edge:               ; preds = %if.end338.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body352.i

do.body348.i:                                     ; preds = %if.end338.i
  %305 = ptrtoint i8* %add.ptr.i2175.i to i64
  call void @__asan_store1_noabort(i64 %305)
  store i8 82, i8* %add.ptr.i2175.i, align 1
  %add.ptr.i2184.i = getelementptr i8, i8* %300, i64 2
  %306 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %306)
  store i8* %add.ptr.i2184.i, i8** %prog.i, align 8
  call void @__sanitizer_cov_trace_const_cmp1(i8 13, i8 %bf.clear.i)
  %cmp349.i = icmp eq i8 %bf.clear.i, 13
  br i1 %cmp349.i, label %do.body348.i.do.end366.i_crit_edge, label %do.body348.i.do.body352.i_crit_edge

do.body348.i.do.body352.i_crit_edge:              ; preds = %do.body348.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body352.i

do.body348.i.do.end366.i_crit_edge:               ; preds = %do.body348.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.end366.i

do.body352.i:                                     ; preds = %do.body348.i.do.body352.i_crit_edge, %if.end338.i.do.body352.i_crit_edge, %do.body348.thread2451.i
  %cmp33924432448.i = phi i1 [ true, %do.body348.i.do.body352.i_crit_edge ], [ true, %do.body348.thread2451.i ], [ false, %if.end338.i.do.body352.i_crit_edge ]
  %307 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %307)
  %308 = load i8*, i8** %prog.i, align 8
  %shl.i10.i2213.i = shl nuw nsw i32 1, %conv5.i
  %309 = and i32 %shl.i10.i2213.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %309)
  %tobool.i11.i2214.i = icmp eq i32 %309, 0
  %idxprom1.i2253.i = zext i8 %bf.clear.i to i64
  %arrayidx2.i2254.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom1.i2253.i
  %310 = ptrtoint i32* %arrayidx2.i2254.i to i64
  call void @__asan_load4_noabort(i64 %310)
  %311 = load i32, i32* %arrayidx2.i2254.i, align 4
  %312 = shl i32 %311, 19
  %conv357.i = add i32 %312, 12779520
  %shl358.i = and i32 %conv357.i, 16449536
  %add355.i = select i1 %tobool.i11.i2214.i, i32 35145, i32 35149
  %add359.i = or i32 %shl358.i, %add355.i
  %313 = bitcast i8* %308 to i32*
  %314 = ptrtoint i32* %313 to i64
  call void @__asan_store4_noabort(i64 %314)
  store i32 %add359.i, i32* %313, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i2263.i = getelementptr i8, i8* %308, i64 3
  %315 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %315)
  store i8* %add.ptr.i2263.i, i8** %prog.i, align 8
  br label %do.end366.i

do.end366.i:                                      ; preds = %do.body348.i.do.end366.i_crit_edge, %do.body352.i
  %cmp33924432449.i = phi i1 [ %cmp33924432448.i, %do.body352.i ], [ true, %do.body348.i.do.end366.i_crit_edge ]
  %316 = ptrtoint i8* %code.i to i64
  call void @__asan_load1_noabort(i64 %316)
  %317 = load i8, i8* %code.i, align 4
  %318 = and i8 %317, 8
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %318)
  %cmp370.i = icmp eq i8 %318, 0
  %319 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %319)
  %320 = load i8*, i8** %prog.i, align 8
  br i1 %cmp370.i, label %if.else373.i, label %if.then372.i

if.then372.i:                                     ; preds = %do.end366.i
  br i1 %cmp328.i, label %do.body.i2265.i, label %if.else.i2282.i

do.body.i2265.i:                                  ; preds = %if.then372.i
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %bf.lshr.i)
  %cmp.i2264.i = icmp eq i8 %bf.lshr.i, 0
  br i1 %cmp.i2264.i, label %do.body.i2265.i.if.end375.i_crit_edge, label %do.body2.i2278.i

do.body.i2265.i.if.end375.i_crit_edge:            ; preds = %do.body.i2265.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end375.i

do.body2.i2278.i:                                 ; preds = %do.body.i2265.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %shl.i10.i.i2266.i = shl nuw nsw i32 1, %conv8.i
  %321 = and i32 %shl.i10.i.i2266.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %321)
  %tobool.i11.i.i2267.i = icmp eq i32 %321, 0
  %idxprom1.i65.i2269.i = zext i8 %bf.lshr.i to i64
  %arrayidx2.i66.i2270.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom1.i65.i2269.i
  %322 = ptrtoint i32* %arrayidx2.i66.i2270.i to i64
  call void @__asan_load4_noabort(i64 %322)
  %323 = load i32, i32* %arrayidx2.i66.i2270.i, align 4
  %shl.i67.i2271.i = shl i32 %323, 19
  %conv4.i2273.i = add i32 %shl.i67.i2271.i, 12582912
  %shl.i2274.i = and i32 %conv4.i2273.i, 16252928
  %add.i2275.i = select i1 %tobool.i11.i.i2267.i, i32 35144, i32 35148
  %add5.i2276.i = or i32 %shl.i2274.i, %add.i2275.i
  %324 = bitcast i8* %320 to i32*
  %325 = ptrtoint i32* %324 to i64
  call void @__asan_store4_noabort(i64 %325)
  store i32 %add5.i2276.i, i32* %324, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i61.i2277.i = getelementptr i8, i8* %320, i64 3
  br label %if.end375.i

if.else.i2282.i:                                  ; preds = %if.then372.i
  %.pre.i2279.i = shl nuw nsw i32 1, %conv8.i
  %.pre70.i2280.i = and i32 %.pre.i2279.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %.pre70.i2280.i)
  %tobool.i.i2281.i = icmp eq i32 %.pre70.i2280.i, 0
  br i1 %tobool.i.i2281.i, label %if.else.i2282.i.do.body23.i2295.i_crit_edge, label %do.body15.i2286.i

if.else.i2282.i.do.body23.i2295.i_crit_edge:      ; preds = %if.else.i2282.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body23.i2295.i

do.body15.i2286.i:                                ; preds = %if.else.i2282.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %326 = ptrtoint i8* %320 to i64
  call void @__asan_store1_noabort(i64 %326)
  store i8 68, i8* %320, align 1
  %add.ptr.i51.i2285.i = getelementptr i8, i8* %320, i64 1
  br label %do.body23.i2295.i

do.body23.i2295.i:                                ; preds = %if.else.i2282.i.do.body23.i2295.i_crit_edge, %do.body15.i2286.i
  %prog.0.i2287.i = phi i8* [ %add.ptr.i51.i2285.i, %do.body15.i2286.i ], [ %320, %if.else.i2282.i.do.body23.i2295.i_crit_edge ]
  %idxprom1.i.i2288.i = zext i8 %bf.lshr.i to i64
  %arrayidx2.i.i2289.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom1.i.i2288.i
  %327 = ptrtoint i32* %arrayidx2.i.i2289.i to i64
  call void @__asan_load4_noabort(i64 %327)
  %328 = load i32, i32* %arrayidx2.i.i2289.i, align 4
  %.tr.i = trunc i32 %328 to i16
  %329 = shl i16 %.tr.i, 11
  %330 = add i16 %329, -16384
  %conv4.i.i2293.i = or i16 %330, 137
  %331 = bitcast i8* %prog.0.i2287.i to i16*
  %332 = ptrtoint i16* %331 to i64
  call void @__asan_store2_noabort(i64 %332)
  store i16 %conv4.i.i2293.i, i16* %331, align 2
  %add.ptr.i.i2294.i = getelementptr i8, i8* %prog.0.i2287.i, i64 2
  br label %if.end375.i

if.else373.i:                                     ; preds = %do.end366.i
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %69)
  %cmp.i2298.i = icmp slt i32 %69, 0
  %or.cond.i2299.i = and i1 %cmp.i2298.i, %cmp328.i
  br i1 %or.cond.i2299.i, label %if.then.i2302.i, label %if.end.i2304.i

if.then.i2302.i:                                  ; preds = %if.else373.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %333 = bitcast i8* %320 to i32*
  %334 = ptrtoint i32* %333 to i64
  call void @__asan_store4_noabort(i64 %334)
  store i32 12633928, i32* %333, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i112.i2300.i = getelementptr i8, i8* %320, i64 3
  %335 = bitcast i8* %add.ptr.i112.i2300.i to i32*
  %336 = ptrtoint i32* %335 to i64
  call void @__asan_store4_noabort(i64 %336)
  store i32 %69, i32* %335, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i111.i2301.i = getelementptr i8, i8* %320, i64 7
  br label %if.end375.i

if.end.i2304.i:                                   ; preds = %if.else373.i
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %69)
  %cmp16.i2303.i = icmp eq i32 %69, 0
  br i1 %cmp16.i2303.i, label %if.then18.i2305.i, label %if.end39.i2309.i

if.then18.i2305.i:                                ; preds = %if.end.i2304.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %337 = bitcast i8* %320 to i16*
  %338 = ptrtoint i16* %337 to i64
  call void @__asan_store2_noabort(i64 %338)
  store i16 -16335, i16* %337, align 2
  %add.ptr.i102.i2307.i = getelementptr i8, i8* %320, i64 2
  br label %if.end375.i

if.end39.i2309.i:                                 ; preds = %if.end.i2304.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %339 = ptrtoint i8* %320 to i64
  call void @__asan_store1_noabort(i64 %339)
  store i8 -72, i8* %320, align 1
  %add.ptr.i94.i2311.i = getelementptr i8, i8* %320, i64 1
  %340 = bitcast i8* %add.ptr.i94.i2311.i to i32*
  %341 = ptrtoint i32* %340 to i64
  call void @__asan_store4_noabort(i64 %341)
  store i32 %69, i32* %340, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i.i2312.i = getelementptr i8, i8* %320, i64 5
  br label %if.end375.i

if.end375.i:                                      ; preds = %do.body.i2265.i.if.end375.i_crit_edge, %if.end39.i2309.i, %if.then18.i2305.i, %if.then.i2302.i, %do.body23.i2295.i, %do.body2.i2278.i
  %storemerge2485.i = phi i8* [ %add.ptr.i61.i2277.i, %do.body2.i2278.i ], [ %320, %do.body.i2265.i.if.end375.i_crit_edge ], [ %add.ptr.i.i2294.i, %do.body23.i2295.i ], [ %add.ptr.i111.i2301.i, %if.then.i2302.i ], [ %add.ptr.i102.i2307.i, %if.then18.i2305.i ], [ %add.ptr.i.i2312.i, %if.end39.i2309.i ]
  %..i = select i1 %cmp328.i, i8 73, i8 65
  %342 = ptrtoint i8* %storemerge2485.i to i64
  call void @__asan_store1_noabort(i64 %342)
  store i8 %..i, i8* %storemerge2485.i, align 1
  %storemerge2489.i = getelementptr i8, i8* %storemerge2485.i, i64 1
  %343 = bitcast i8* %storemerge2489.i to i16*
  %344 = ptrtoint i16* %343 to i64
  call void @__asan_store2_noabort(i64 %344)
  store i16 -7177, i16* %343, align 2
  %add.ptr.i2394.i = getelementptr i8, i8* %storemerge2485.i, i64 3
  %345 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %345)
  store i8* %add.ptr.i2394.i, i8** %prog.i, align 8
  br i1 %cmp33924432449.i, label %do.body409.i, label %if.end375.i.if.end414.i_crit_edge

if.end375.i.if.end414.i_crit_edge:                ; preds = %if.end375.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end414.i

do.body409.i:                                     ; preds = %if.end375.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %346 = ptrtoint i8* %add.ptr.i2394.i to i64
  call void @__asan_store1_noabort(i64 %346)
  store i8 90, i8* %add.ptr.i2394.i, align 1
  %add.ptr.i2408.i = getelementptr i8, i8* %storemerge2485.i, i64 4
  %347 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %347)
  store i8* %add.ptr.i2408.i, i8** %prog.i, align 8
  br label %if.end414.i

if.end414.i:                                      ; preds = %if.end375.i.if.end414.i_crit_edge, %do.body409.i
  br i1 %cmp330.i, label %do.body422.i, label %if.end414.i.sw.epilog1406.i_crit_edge

if.end414.i.sw.epilog1406.i_crit_edge:            ; preds = %if.end414.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.epilog1406.i

do.body422.i:                                     ; preds = %if.end414.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %348 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %348)
  %349 = load i8*, i8** %prog.i, align 8
  %shl.i.i2411.i = shl nuw nsw i32 1, %conv5.i
  %350 = and i32 %shl.i.i2411.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %350)
  %tobool.i.i2412.i = icmp ne i32 %350, 0
  %351 = zext i1 %tobool.i.i2412.i to i32
  %idxprom.i2436.i = zext i8 %bf.clear.i to i64
  %arrayidx.i2437.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom.i2436.i
  %352 = ptrtoint i32* %arrayidx.i2437.i to i64
  call void @__asan_load4_noabort(i64 %352)
  %353 = load i32, i32* %arrayidx.i2437.i, align 4
  %conv4.i2439.i = shl i32 %353, 16
  %conv427.i = add i32 %conv4.i2439.i, 12582912
  %shl428.i = and i32 %conv427.i, 16711680
  %add425.i = or i32 %shl428.i, %351
  %add429.i = or i32 %add425.i, 35144
  %354 = bitcast i8* %349 to i32*
  %355 = ptrtoint i32* %354 to i64
  call void @__asan_store4_noabort(i64 %355)
  store i32 %add429.i, i32* %354, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i2435.i = getelementptr i8, i8* %349, i64 3
  %356 = ptrtoint i8* %add.ptr.i2435.i to i64
  call void @__asan_store1_noabort(i64 %356)
  store i8 88, i8* %add.ptr.i2435.i, align 1
  %add.ptr.i2433.i = getelementptr i8, i8* %349, i64 4
  %357 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %357)
  store i8* %add.ptr.i2433.i, i8** %prog.i, align 8
  br label %sw.epilog1406.i

sw.bb443.i:                                       ; preds = %for.body.i.sw.bb443.i_crit_edge811, %for.body.i.sw.bb443.i_crit_edge810, %for.body.i.sw.bb443.i_crit_edge809, %for.body.i.sw.bb443.i_crit_edge808, %for.body.i.sw.bb443.i_crit_edge807, %for.body.i.sw.bb443.i_crit_edge
  %358 = and i8 %72, 7
  call void @__sanitizer_cov_trace_const_cmp1(i8 7, i8 %358)
  %cmp447.i = icmp eq i8 %358, 7
  br i1 %cmp447.i, label %do.body450.i, label %if.else457.i

do.body450.i:                                     ; preds = %sw.bb443.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %359 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %359)
  %360 = load i8*, i8** %prog.i, align 8
  %shl.i.i2429.i = shl nuw nsw i32 1, %conv5.i
  %361 = and i32 %shl.i.i2429.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %361)
  %tobool.i.i2430.i = icmp ne i32 %361, 0
  %362 = zext i1 %tobool.i.i2430.i to i8
  %spec.select.i2431.i = or i8 %362, 72
  %363 = ptrtoint i8* %360 to i64
  call void @__asan_store1_noabort(i64 %363)
  store i8 %spec.select.i2431.i, i8* %360, align 1
  %add.ptr.i2428.i = getelementptr i8, i8* %360, i64 1
  %364 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %364)
  store i8* %add.ptr.i2428.i, i8** %prog.i, align 8
  br label %if.end468.i

if.else457.i:                                     ; preds = %sw.bb443.i
  %shl.i2425.i = shl nuw nsw i32 1, %conv5.i
  %365 = and i32 %shl.i2425.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %365)
  %tobool.i2426.i = icmp eq i32 %365, 0
  br i1 %tobool.i2426.i, label %if.else457.i.if.end468.i_crit_edge, label %do.body460.i

if.else457.i.if.end468.i_crit_edge:               ; preds = %if.else457.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end468.i

do.body460.i:                                     ; preds = %if.else457.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %366 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %366)
  %367 = load i8*, i8** %prog.i, align 8
  %368 = ptrtoint i8* %367 to i64
  call void @__asan_store1_noabort(i64 %368)
  store i8 65, i8* %367, align 1
  %add.ptr.i2421.i = getelementptr i8, i8* %367, i64 1
  store i8* %add.ptr.i2421.i, i8** %prog.i, align 8
  br label %if.end468.i

if.end468.i:                                      ; preds = %if.else457.i.if.end468.i_crit_edge, %do.body460.i, %do.body450.i
  %369 = ptrtoint i8* %code.i to i64
  call void @__asan_load1_noabort(i64 %369)
  %370 = load i8, i8* %code.i, align 4
  %371 = and i8 %370, -16
  %372 = zext i8 %371 to i64
  call void @__sanitizer_cov_trace_switch(i64 %372, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__sancov_gen_cov_switch_values.25, i32 0, i32 0))
  switch i8 %371, label %if.end468.i.sw.epilog475.i_crit_edge [
    i8 96, label %sw.bb472.i
    i8 112, label %sw.bb473.i
    i8 -64, label %sw.bb474.i
  ]

if.end468.i.sw.epilog475.i_crit_edge:             ; preds = %if.end468.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.epilog475.i

sw.bb472.i:                                       ; preds = %if.end468.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.epilog475.i

sw.bb473.i:                                       ; preds = %if.end468.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.epilog475.i

sw.bb474.i:                                       ; preds = %if.end468.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.epilog475.i

sw.epilog475.i:                                   ; preds = %if.end468.i.sw.epilog475.i_crit_edge, %sw.bb474.i, %sw.bb473.i, %sw.bb472.i
  %b3.1.i = phi i32 [ 0, %if.end468.i.sw.epilog475.i_crit_edge ], [ 248, %sw.bb474.i ], [ 232, %sw.bb473.i ], [ 224, %sw.bb472.i ]
  call void @__sanitizer_cov_trace_const_cmp4(i32 1, i32 %69)
  %cmp476.i = icmp eq i32 %69, 1
  %373 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %373)
  %374 = load i8*, i8** %prog.i, align 8
  %idxprom.i2417.i = zext i8 %bf.clear.i to i64
  %arrayidx.i2418.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom.i2417.i
  %375 = ptrtoint i32* %arrayidx.i2418.i to i64
  call void @__asan_load4_noabort(i64 %375)
  %376 = load i32, i32* %arrayidx.i2418.i, align 4
  %conv1.i2419.i = add i32 %376, %b3.1.i
  %conv481.i = shl i32 %conv1.i2419.i, 8
  br i1 %cmp476.i, label %do.body479.i, label %do.body489.i

do.body479.i:                                     ; preds = %sw.epilog475.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %377 = trunc i32 %conv481.i to i16
  %conv4.i2414.i = or i16 %377, 209
  %378 = bitcast i8* %374 to i16*
  %379 = ptrtoint i16* %378 to i64
  call void @__asan_store2_noabort(i64 %379)
  store i16 %conv4.i2414.i, i16* %378, align 2
  %add.ptr.i2416.i = getelementptr i8, i8* %374, i64 2
  %380 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %380)
  store i8* %add.ptr.i2416.i, i8** %prog.i, align 8
  br label %sw.epilog1406.i

do.body489.i:                                     ; preds = %sw.epilog475.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %shl482.i = and i32 %conv481.i, 65280
  %shl494.i = shl i32 %69, 16
  %add493.i = or i32 %shl494.i, %shl482.i
  %add495.i = or i32 %add493.i, 193
  %381 = bitcast i8* %374 to i32*
  %382 = ptrtoint i32* %381 to i64
  call void @__asan_store4_noabort(i64 %382)
  store i32 %add495.i, i32* %381, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i2410.i = getelementptr i8, i8* %374, i64 3
  %383 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %383)
  store i8* %add.ptr.i2410.i, i8** %prog.i, align 8
  br label %sw.epilog1406.i

sw.bb501.i:                                       ; preds = %for.body.i.sw.bb501.i_crit_edge816, %for.body.i.sw.bb501.i_crit_edge815, %for.body.i.sw.bb501.i_crit_edge814, %for.body.i.sw.bb501.i_crit_edge813, %for.body.i.sw.bb501.i_crit_edge812, %for.body.i.sw.bb501.i_crit_edge
  call void @__sanitizer_cov_trace_const_cmp1(i8 4, i8 %bf.clear.i)
  %cmp502.i = icmp eq i8 %bf.clear.i, 4
  br i1 %cmp502.i, label %do.body509.i, label %sw.bb501.i.if.end524.i_crit_edge

sw.bb501.i.if.end524.i_crit_edge:                 ; preds = %sw.bb501.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end524.i

do.body509.i:                                     ; preds = %sw.bb501.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %384 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %384)
  %385 = load i8*, i8** %prog.i, align 8
  %386 = bitcast i8* %385 to i32*
  %387 = ptrtoint i32* %386 to i64
  call void @__asan_store4_noabort(i64 %387)
  store i32 13338953, i32* %386, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i2406.i = getelementptr i8, i8* %385, i64 3
  %388 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %388)
  store i8* %add.ptr.i2406.i, i8** %prog.i, align 8
  br label %if.end524.i

if.end524.i:                                      ; preds = %sw.bb501.i.if.end524.i_crit_edge, %do.body509.i
  %dst_reg.0.i = phi i32 [ 13, %do.body509.i ], [ %conv5.i, %sw.bb501.i.if.end524.i_crit_edge ]
  call void @__sanitizer_cov_trace_const_cmp1(i8 4, i8 %bf.lshr.i)
  %cmp525.i = icmp ne i8 %bf.lshr.i, 4
  br i1 %cmp525.i, label %do.body528.i, label %if.end524.i.if.end552.i_crit_edge

if.end524.i.if.end552.i_crit_edge:                ; preds = %if.end524.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end552.i

do.body528.i:                                     ; preds = %if.end524.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %389 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %389)
  %390 = load i8*, i8** %prog.i, align 8
  %391 = ptrtoint i8* %390 to i64
  call void @__asan_store1_noabort(i64 %391)
  store i8 81, i8* %390, align 1
  %add.ptr.i2404.i = getelementptr i8, i8* %390, i64 1
  store i8* %add.ptr.i2404.i, i8** %prog.i, align 8
  %shl.i10.i2400.i = shl nuw nsw i32 1, %conv8.i
  %392 = and i32 %shl.i10.i2400.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %392)
  %tobool.i11.i2401.i = icmp eq i32 %392, 0
  %idxprom1.i2395.i = zext i8 %bf.lshr.i to i64
  %arrayidx2.i2396.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom1.i2395.i
  %393 = ptrtoint i32* %arrayidx2.i2396.i to i64
  call void @__asan_load4_noabort(i64 %393)
  %394 = load i32, i32* %arrayidx2.i2396.i, align 4
  %395 = shl i32 %394, 19
  %conv542.i = add i32 %395, 12648448
  %shl543.i = and i32 %conv542.i, 16318464
  %add540.i = select i1 %tobool.i11.i2401.i, i32 35144, i32 35148
  %add544.i = or i32 %shl543.i, %add540.i
  %396 = bitcast i8* %add.ptr.i2404.i to i32*
  %397 = ptrtoint i32* %396 to i64
  call void @__asan_store4_noabort(i64 %397)
  store i32 %add544.i, i32* %396, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i2392.i = getelementptr i8, i8* %390, i64 4
  %398 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %398)
  store i8* %add.ptr.i2392.i, i8** %prog.i, align 8
  br label %if.end552.i

if.end552.i:                                      ; preds = %if.end524.i.if.end552.i_crit_edge, %do.body528.i
  %399 = ptrtoint i8* %code.i to i64
  call void @__asan_load1_noabort(i64 %399)
  %400 = load i8, i8* %code.i, align 4
  %401 = and i8 %400, 7
  call void @__sanitizer_cov_trace_const_cmp1(i8 7, i8 %401)
  %cmp556.i = icmp eq i8 %401, 7
  br i1 %cmp556.i, label %do.body559.i, label %if.else566.i

do.body559.i:                                     ; preds = %if.end552.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %402 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %402)
  %403 = load i8*, i8** %prog.i, align 8
  %shl.i.i2388.i = shl nuw nsw i32 1, %dst_reg.0.i
  %404 = and i32 %shl.i.i2388.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %404)
  %tobool.i.i2389.i = icmp ne i32 %404, 0
  %405 = zext i1 %tobool.i.i2389.i to i8
  %spec.select.i2390.i = or i8 %405, 72
  %406 = ptrtoint i8* %403 to i64
  call void @__asan_store1_noabort(i64 %406)
  store i8 %spec.select.i2390.i, i8* %403, align 1
  %add.ptr.i2387.i = getelementptr i8, i8* %403, i64 1
  %407 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %407)
  store i8* %add.ptr.i2387.i, i8** %prog.i, align 8
  br label %if.end577.i

if.else566.i:                                     ; preds = %if.end552.i
  %shl.i2384.i = shl nuw nsw i32 1, %dst_reg.0.i
  %408 = and i32 %shl.i2384.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %408)
  %tobool.i2385.i = icmp eq i32 %408, 0
  br i1 %tobool.i2385.i, label %if.else566.i.if.end577.i_crit_edge, label %do.body569.i

if.else566.i.if.end577.i_crit_edge:               ; preds = %if.else566.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end577.i

do.body569.i:                                     ; preds = %if.else566.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %409 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %409)
  %410 = load i8*, i8** %prog.i, align 8
  %411 = ptrtoint i8* %410 to i64
  call void @__asan_store1_noabort(i64 %411)
  store i8 65, i8* %410, align 1
  %add.ptr.i2380.i = getelementptr i8, i8* %410, i64 1
  store i8* %add.ptr.i2380.i, i8** %prog.i, align 8
  br label %if.end577.i

if.end577.i:                                      ; preds = %if.else566.i.if.end577.i_crit_edge, %do.body569.i, %do.body559.i
  %412 = ptrtoint i8* %code.i to i64
  call void @__asan_load1_noabort(i64 %412)
  %413 = load i8, i8* %code.i, align 4
  %414 = and i8 %413, -16
  %415 = zext i8 %414 to i64
  call void @__sanitizer_cov_trace_switch(i64 %415, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__sancov_gen_cov_switch_values.26, i32 0, i32 0))
  switch i8 %414, label %if.end577.i.do.body585.i_crit_edge [
    i8 96, label %sw.bb581.i
    i8 112, label %sw.bb582.i
    i8 -64, label %sw.bb583.i
  ]

if.end577.i.do.body585.i_crit_edge:               ; preds = %if.end577.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body585.i

sw.bb581.i:                                       ; preds = %if.end577.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body585.i

sw.bb582.i:                                       ; preds = %if.end577.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body585.i

sw.bb583.i:                                       ; preds = %if.end577.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body585.i

do.body585.i:                                     ; preds = %if.end577.i.do.body585.i_crit_edge, %sw.bb583.i, %sw.bb582.i, %sw.bb581.i
  %b3.2.i = phi i32 [ 0, %if.end577.i.do.body585.i_crit_edge ], [ 248, %sw.bb583.i ], [ 232, %sw.bb582.i ], [ 224, %sw.bb581.i ]
  %416 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %416)
  %417 = load i8*, i8** %prog.i, align 8
  %idxprom.i2376.i = zext i32 %dst_reg.0.i to i64
  %arrayidx.i2377.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom.i2376.i
  %418 = ptrtoint i32* %arrayidx.i2377.i to i64
  call void @__asan_load4_noabort(i64 %418)
  %419 = load i32, i32* %arrayidx.i2377.i, align 4
  %conv1.i2378.i = add i32 %419, %b3.2.i
  %conv1.i2378.tr.i = trunc i32 %conv1.i2378.i to i16
  %420 = shl i16 %conv1.i2378.tr.i, 8
  %conv4.i2373.i = or i16 %420, 211
  %421 = bitcast i8* %417 to i16*
  %422 = ptrtoint i16* %421 to i64
  call void @__asan_store2_noabort(i64 %422)
  store i16 %conv4.i2373.i, i16* %421, align 2
  %add.ptr.i2375.i = getelementptr i8, i8* %417, i64 2
  store i8* %add.ptr.i2375.i, i8** %prog.i, align 8
  br i1 %cmp525.i, label %do.body597.i, label %do.body585.i.if.end602.i_crit_edge

do.body585.i.if.end602.i_crit_edge:               ; preds = %do.body585.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end602.i

do.body597.i:                                     ; preds = %do.body585.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %423 = ptrtoint i8* %add.ptr.i2375.i to i64
  call void @__asan_store1_noabort(i64 %423)
  store i8 89, i8* %add.ptr.i2375.i, align 1
  %add.ptr.i2372.i = getelementptr i8, i8* %417, i64 3
  %424 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %424)
  store i8* %add.ptr.i2372.i, i8** %prog.i, align 8
  br label %if.end602.i

if.end602.i:                                      ; preds = %do.body585.i.if.end602.i_crit_edge, %do.body597.i
  %425 = ptrtoint i8* %dst_reg4.i to i64
  call void @__asan_load1_noabort(i64 %425)
  %bf.load604.i = load i8, i8* %dst_reg4.i, align 1
  %bf.clear605.i = and i8 %bf.load604.i, 15
  call void @__sanitizer_cov_trace_const_cmp1(i8 4, i8 %bf.clear605.i)
  %cmp607.i = icmp eq i8 %bf.clear605.i, 4
  br i1 %cmp607.i, label %do.body618.i, label %if.end602.i.sw.epilog1406.i_crit_edge

if.end602.i.sw.epilog1406.i_crit_edge:            ; preds = %if.end602.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.epilog1406.i

do.body618.i:                                     ; preds = %if.end602.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %426 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %426)
  %427 = load i8*, i8** %prog.i, align 8
  %428 = bitcast i8* %427 to i32*
  %429 = ptrtoint i32* %428 to i64
  call void @__asan_store4_noabort(i64 %429)
  store i32 14256460, i32* %428, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i2365.i = getelementptr i8, i8* %427, i64 3
  %430 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %430)
  store i8* %add.ptr.i2365.i, i8** %prog.i, align 8
  br label %sw.epilog1406.i

sw.bb642.i:                                       ; preds = %for.body.i
  %431 = zext i32 %69 to i64
  call void @__sanitizer_cov_trace_switch(i64 %431, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__sancov_gen_cov_switch_values.27, i32 0, i32 0))
  switch i32 %69, label %sw.bb642.i.sw.epilog1406.i_crit_edge [
    i32 16, label %do.body644.i
    i32 32, label %sw.bb688.i
    i32 64, label %do.body711.i
  ]

sw.bb642.i.sw.epilog1406.i_crit_edge:             ; preds = %sw.bb642.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.epilog1406.i

do.body644.i:                                     ; preds = %sw.bb642.i
  %432 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %432)
  %433 = load i8*, i8** %prog.i, align 8
  %434 = ptrtoint i8* %433 to i64
  call void @__asan_store1_noabort(i64 %434)
  store i8 102, i8* %433, align 1
  %add.ptr.i2363.i = getelementptr i8, i8* %433, i64 1
  store i8* %add.ptr.i2363.i, i8** %prog.i, align 8
  %shl.i2360.i = shl nuw nsw i32 1, %conv5.i
  %435 = and i32 %shl.i2360.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %435)
  %tobool.i2361.i = icmp ne i32 %435, 0
  br i1 %tobool.i2361.i, label %do.body651.i, label %do.body644.i.do.body657.i_crit_edge

do.body644.i.do.body657.i_crit_edge:              ; preds = %do.body644.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body657.i

do.body651.i:                                     ; preds = %do.body644.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %436 = ptrtoint i8* %add.ptr.i2363.i to i64
  call void @__asan_store1_noabort(i64 %436)
  store i8 65, i8* %add.ptr.i2363.i, align 1
  %add.ptr.i2359.i = getelementptr i8, i8* %433, i64 2
  %437 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %437)
  store i8* %add.ptr.i2359.i, i8** %prog.i, align 8
  br label %do.body657.i

do.body657.i:                                     ; preds = %do.body644.i.do.body657.i_crit_edge, %do.body651.i
  %438 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %438)
  %439 = load i8*, i8** %prog.i, align 8
  %idxprom.i2355.i = zext i8 %bf.clear.i to i64
  %arrayidx.i2356.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom.i2355.i
  %440 = ptrtoint i32* %arrayidx.i2356.i to i64
  call void @__asan_load4_noabort(i64 %440)
  %441 = load i32, i32* %arrayidx.i2356.i, align 4
  %conv1.i2357.i = shl i32 %441, 8
  %conv659.i = add i32 %conv1.i2357.i, 51200
  %shl660.i = and i32 %conv659.i, 65280
  %add662.i = or i32 %shl660.i, 524481
  %442 = bitcast i8* %439 to i32*
  %443 = ptrtoint i32* %442 to i64
  call void @__asan_store4_noabort(i64 %443)
  store i32 %add662.i, i32* %442, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i2352.i = getelementptr i8, i8* %439, i64 3
  %444 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %444)
  store i8* %add.ptr.i2352.i, i8** %prog.i, align 8
  br i1 %tobool.i2361.i, label %do.body669.i, label %do.body675.i

do.body669.i:                                     ; preds = %do.body657.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %445 = bitcast i8* %add.ptr.i2352.i to i32*
  %446 = ptrtoint i32* %445 to i64
  call void @__asan_store4_noabort(i64 %446)
  store i32 11996997, i32* %445, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  br label %do.body681.i

do.body675.i:                                     ; preds = %do.body657.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %447 = bitcast i8* %add.ptr.i2352.i to i16*
  %448 = ptrtoint i16* %447 to i64
  call void @__asan_store2_noabort(i64 %448)
  store i16 -18673, i16* %447, align 2
  br label %do.body681.i

do.body681.i:                                     ; preds = %do.body675.i, %do.body669.i
  %.sink = phi i64 [ 5, %do.body675.i ], [ 6, %do.body669.i ]
  %add.ptr.i2346.i = getelementptr i8, i8* %439, i64 %.sink
  %add.i2339.i = add i32 %441, 192
  %shl.i2342.i = shl i32 %441, 3
  %add3.i2343.i = add i32 %add.i2339.i, %shl.i2342.i
  %conv4.i2344.i = trunc i32 %add3.i2343.i to i8
  %449 = ptrtoint i8* %add.ptr.i2346.i to i64
  call void @__asan_store1_noabort(i64 %449)
  store i8 %conv4.i2344.i, i8* %add.ptr.i2346.i, align 1
  %add.ptr.i2336.i = getelementptr i8, i8* %add.ptr.i2346.i, i64 1
  %450 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %450)
  store i8* %add.ptr.i2336.i, i8** %prog.i, align 8
  br label %sw.epilog1406.i

sw.bb688.i:                                       ; preds = %sw.bb642.i
  %shl.i2333.i = shl nuw nsw i32 1, %conv5.i
  %451 = and i32 %shl.i2333.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %451)
  %tobool.i2334.i = icmp eq i32 %451, 0
  %452 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %452)
  %453 = load i8*, i8** %prog.i, align 8
  br i1 %tobool.i2334.i, label %do.body697.i, label %do.body691.i

do.body691.i:                                     ; preds = %sw.bb688.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %454 = bitcast i8* %453 to i16*
  %455 = ptrtoint i16* %454 to i64
  call void @__asan_store2_noabort(i64 %455)
  store i16 3905, i16* %454, align 2
  br label %do.body703.i

do.body697.i:                                     ; preds = %sw.bb688.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %456 = ptrtoint i8* %453 to i64
  call void @__asan_store1_noabort(i64 %456)
  store i8 15, i8* %453, align 1
  br label %do.body703.i

do.body703.i:                                     ; preds = %do.body697.i, %do.body691.i
  %.sink629 = phi i64 [ 1, %do.body697.i ], [ 2, %do.body691.i ]
  %add.ptr.i2330.i = getelementptr i8, i8* %453, i64 %.sink629
  %idxprom.i2326.i = zext i8 %bf.clear.i to i64
  %arrayidx.i2327.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom.i2326.i
  %457 = ptrtoint i32* %arrayidx.i2327.i to i64
  call void @__asan_load4_noabort(i64 %457)
  %458 = load i32, i32* %arrayidx.i2327.i, align 4
  %459 = trunc i32 %458 to i8
  %conv1.i2328.i = add i8 %459, -56
  %460 = ptrtoint i8* %add.ptr.i2330.i to i64
  call void @__asan_store1_noabort(i64 %460)
  store i8 %conv1.i2328.i, i8* %add.ptr.i2330.i, align 1
  %add.ptr.i2325.i = getelementptr i8, i8* %add.ptr.i2330.i, i64 1
  %461 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %461)
  store i8* %add.ptr.i2325.i, i8** %prog.i, align 8
  br label %sw.epilog1406.i

do.body711.i:                                     ; preds = %sw.bb642.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %462 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %462)
  %463 = load i8*, i8** %prog.i, align 8
  %shl.i.i2321.i = shl nuw nsw i32 1, %conv5.i
  %464 = and i32 %shl.i.i2321.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %464)
  %tobool.i.i2322.i = icmp ne i32 %464, 0
  %465 = zext i1 %tobool.i.i2322.i to i32
  %idxprom.i2318.i = zext i8 %bf.clear.i to i64
  %arrayidx.i2319.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom.i2318.i
  %466 = ptrtoint i32* %arrayidx.i2319.i to i64
  call void @__asan_load4_noabort(i64 %466)
  %467 = load i32, i32* %arrayidx.i2319.i, align 4
  %conv1.i2320.i = shl i32 %467, 16
  %conv716.i = add i32 %conv1.i2320.i, 13107200
  %shl717.i = and i32 %conv716.i, 16711680
  %add714.i = or i32 %shl717.i, %465
  %add718.i = or i32 %add714.i, 3912
  %468 = bitcast i8* %463 to i32*
  %469 = ptrtoint i32* %468 to i64
  call void @__asan_store4_noabort(i64 %469)
  store i32 %add718.i, i32* %468, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i2261.i = getelementptr i8, i8* %463, i64 3
  %470 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %470)
  store i8* %add.ptr.i2261.i, i8** %prog.i, align 8
  br label %sw.epilog1406.i

sw.bb724.i:                                       ; preds = %for.body.i
  %471 = zext i32 %69 to i64
  call void @__sanitizer_cov_trace_switch(i64 %471, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__sancov_gen_cov_switch_values.28, i32 0, i32 0))
  switch i32 %69, label %sw.bb724.i.sw.epilog1406.i_crit_edge [
    i32 16, label %sw.bb725.i
    i32 32, label %sw.bb747.i
  ]

sw.bb724.i.sw.epilog1406.i_crit_edge:             ; preds = %sw.bb724.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.epilog1406.i

sw.bb725.i:                                       ; preds = %sw.bb724.i
  %shl.i2258.i = shl nuw nsw i32 1, %conv5.i
  %472 = and i32 %shl.i2258.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %472)
  %tobool.i2259.i = icmp eq i32 %472, 0
  %473 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %473)
  %474 = load i8*, i8** %prog.i, align 8
  br i1 %tobool.i2259.i, label %do.body734.i, label %do.body728.i

do.body728.i:                                     ; preds = %sw.bb725.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %475 = bitcast i8* %474 to i32*
  %476 = ptrtoint i32* %475 to i64
  call void @__asan_store4_noabort(i64 %476)
  store i32 11996997, i32* %475, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  br label %do.body740.i

do.body734.i:                                     ; preds = %sw.bb725.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %477 = bitcast i8* %474 to i16*
  %478 = ptrtoint i16* %477 to i64
  call void @__asan_store2_noabort(i64 %478)
  store i16 -18673, i16* %477, align 2
  br label %do.body740.i

do.body740.i:                                     ; preds = %do.body734.i, %do.body728.i
  %.sink630 = phi i64 [ 2, %do.body734.i ], [ 3, %do.body728.i ]
  %add.ptr.i2250.i = getelementptr i8, i8* %474, i64 %.sink630
  %idxprom.i2241.i = zext i8 %bf.clear.i to i64
  %arrayidx.i2242.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom.i2241.i
  %479 = ptrtoint i32* %arrayidx.i2242.i to i64
  call void @__asan_load4_noabort(i64 %479)
  %480 = load i32, i32* %arrayidx.i2242.i, align 4
  %add.i2243.i = add i32 %480, 192
  %shl.i2246.i = shl i32 %480, 3
  %add3.i2247.i = add i32 %add.i2243.i, %shl.i2246.i
  %conv4.i2248.i = trunc i32 %add3.i2247.i to i8
  %481 = ptrtoint i8* %add.ptr.i2250.i to i64
  call void @__asan_store1_noabort(i64 %481)
  store i8 %conv4.i2248.i, i8* %add.ptr.i2250.i, align 1
  %add.ptr.i2240.i = getelementptr i8, i8* %add.ptr.i2250.i, i64 1
  %482 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %482)
  store i8* %add.ptr.i2240.i, i8** %prog.i, align 8
  br label %sw.epilog1406.i

sw.bb747.i:                                       ; preds = %sw.bb724.i
  %shl.i2237.i = shl nuw nsw i32 1, %conv5.i
  %483 = and i32 %shl.i2237.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %483)
  %tobool.i2238.i = icmp eq i32 %483, 0
  br i1 %tobool.i2238.i, label %sw.bb747.i.do.body756.i_crit_edge, label %do.body750.i

sw.bb747.i.do.body756.i_crit_edge:                ; preds = %sw.bb747.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body756.i

do.body750.i:                                     ; preds = %sw.bb747.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %484 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %484)
  %485 = load i8*, i8** %prog.i, align 8
  %486 = ptrtoint i8* %485 to i64
  call void @__asan_store1_noabort(i64 %486)
  store i8 69, i8* %485, align 1
  %add.ptr.i2236.i = getelementptr i8, i8* %485, i64 1
  store i8* %add.ptr.i2236.i, i8** %prog.i, align 8
  br label %do.body756.i

do.body756.i:                                     ; preds = %sw.bb747.i.do.body756.i_crit_edge, %do.body750.i
  %487 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %487)
  %488 = load i8*, i8** %prog.i, align 8
  %idxprom.i2227.i = zext i8 %bf.clear.i to i64
  %arrayidx.i2228.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom.i2227.i
  %489 = ptrtoint i32* %arrayidx.i2228.i to i64
  call void @__asan_load4_noabort(i64 %489)
  %490 = load i32, i32* %arrayidx.i2228.i, align 4
  %add.i2229.i = add i32 %490, 192
  %shl.i2232.i = shl i32 %490, 3
  %add3.i2233.i = add i32 %add.i2229.i, %shl.i2232.i
  %add3.i2233.tr.i = trunc i32 %add3.i2233.i to i16
  %491 = shl i16 %add3.i2233.tr.i, 8
  %conv4.i2224.i = or i16 %491, 137
  %492 = bitcast i8* %488 to i16*
  %493 = ptrtoint i16* %492 to i64
  call void @__asan_store2_noabort(i64 %493)
  store i16 %conv4.i2224.i, i16* %492, align 2
  %add.ptr.i2226.i = getelementptr i8, i8* %488, i64 2
  store i8* %add.ptr.i2226.i, i8** %prog.i, align 8
  br label %sw.epilog1406.i

sw.bb766.i:                                       ; preds = %for.body.i
  %shl.i2222.i = shl nuw nsw i32 1, %conv5.i
  %494 = and i32 %shl.i2222.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %494)
  %tobool.i2223.i = icmp eq i32 %494, 0
  %495 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %495)
  %496 = load i8*, i8** %prog.i, align 8
  br i1 %tobool.i2223.i, label %do.body775.i, label %do.body769.i

do.body769.i:                                     ; preds = %sw.bb766.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %497 = bitcast i8* %496 to i16*
  %498 = ptrtoint i16* %497 to i64
  call void @__asan_store2_noabort(i64 %498)
  store i16 -14783, i16* %497, align 2
  %add.ptr.i2221.i = getelementptr i8, i8* %496, i64 2
  %499 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %499)
  store i8* %add.ptr.i2221.i, i8** %prog.i, align 8
  br label %st.i

do.body775.i:                                     ; preds = %sw.bb766.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %500 = ptrtoint i8* %496 to i64
  call void @__asan_store1_noabort(i64 %500)
  store i8 -58, i8* %496, align 1
  %add.ptr.i2219.i = getelementptr i8, i8* %496, i64 1
  %501 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %501)
  store i8* %add.ptr.i2219.i, i8** %prog.i, align 8
  br label %st.i

sw.bb781.i:                                       ; preds = %for.body.i
  %shl.i2216.i = shl nuw nsw i32 1, %conv5.i
  %502 = and i32 %shl.i2216.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %502)
  %tobool.i2217.i = icmp eq i32 %502, 0
  %503 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %503)
  %504 = load i8*, i8** %prog.i, align 8
  br i1 %tobool.i2217.i, label %do.body790.i, label %do.body784.i

do.body784.i:                                     ; preds = %sw.bb781.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %505 = bitcast i8* %504 to i32*
  %506 = ptrtoint i32* %505 to i64
  call void @__asan_store4_noabort(i64 %506)
  store i32 13058406, i32* %505, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i2212.i = getelementptr i8, i8* %504, i64 3
  %507 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %507)
  store i8* %add.ptr.i2212.i, i8** %prog.i, align 8
  br label %st.i

do.body790.i:                                     ; preds = %sw.bb781.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %508 = bitcast i8* %504 to i16*
  %509 = ptrtoint i16* %508 to i64
  call void @__asan_store2_noabort(i64 %509)
  store i16 -14490, i16* %508, align 2
  %add.ptr.i2210.i = getelementptr i8, i8* %504, i64 2
  %510 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %510)
  store i8* %add.ptr.i2210.i, i8** %prog.i, align 8
  br label %st.i

sw.bb796.i:                                       ; preds = %for.body.i
  %shl.i2207.i = shl nuw nsw i32 1, %conv5.i
  %511 = and i32 %shl.i2207.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %511)
  %tobool.i2208.i = icmp eq i32 %511, 0
  %512 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %512)
  %513 = load i8*, i8** %prog.i, align 8
  br i1 %tobool.i2208.i, label %do.body805.i, label %do.body799.i

do.body799.i:                                     ; preds = %sw.bb796.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %514 = bitcast i8* %513 to i16*
  %515 = ptrtoint i16* %514 to i64
  call void @__asan_store2_noabort(i64 %515)
  store i16 -14527, i16* %514, align 2
  %add.ptr.i2206.i = getelementptr i8, i8* %513, i64 2
  %516 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %516)
  store i8* %add.ptr.i2206.i, i8** %prog.i, align 8
  br label %st.i

do.body805.i:                                     ; preds = %sw.bb796.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %517 = ptrtoint i8* %513 to i64
  call void @__asan_store1_noabort(i64 %517)
  store i8 -57, i8* %513, align 1
  %add.ptr.i2204.i = getelementptr i8, i8* %513, i64 1
  %518 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %518)
  store i8* %add.ptr.i2204.i, i8** %prog.i, align 8
  br label %st.i

do.body812.i:                                     ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %519 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %519)
  %520 = load i8*, i8** %prog.i, align 8
  %shl.i.i2200.i = shl nuw nsw i32 1, %conv5.i
  %521 = and i32 %shl.i.i2200.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %521)
  %tobool.i.i2201.i = icmp ne i32 %521, 0
  %522 = zext i1 %tobool.i.i2201.i to i16
  %conv4.i2197.i = or i16 %522, -14520
  %523 = bitcast i8* %520 to i16*
  %524 = ptrtoint i16* %523 to i64
  call void @__asan_store2_noabort(i64 %524)
  store i16 %conv4.i2197.i, i16* %523, align 2
  %add.ptr.i2199.i = getelementptr i8, i8* %520, i64 2
  %525 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %525)
  store i8* %add.ptr.i2199.i, i8** %prog.i, align 8
  br label %st.i

st.i:                                             ; preds = %do.body812.i, %do.body805.i, %do.body799.i, %do.body790.i, %do.body784.i, %do.body775.i, %do.body769.i
  %off.i = getelementptr inbounds %struct.bpf_insn, %struct.bpf_insn* %insn.02525.i, i64 0, i32 2
  %526 = ptrtoint i16* %off.i to i64
  call void @__asan_load2_noabort(i64 %526)
  %527 = load i16, i16* %off.i, align 2
  %conv820.i = sext i16 %527 to i32
  %value.off.i2196.i = add nsw i32 %conv820.i, 128
  call void @__sanitizer_cov_trace_const_cmp4(i32 256, i32 %value.off.i2196.i)
  %528 = icmp ult i32 %value.off.i2196.i, 256
  %529 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %529)
  %530 = load i8*, i8** %prog.i, align 8
  %idxprom.i2193.i = zext i8 %bf.clear.i to i64
  %arrayidx.i2194.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom.i2193.i
  %531 = ptrtoint i32* %arrayidx.i2194.i to i64
  call void @__asan_load4_noabort(i64 %531)
  %532 = load i32, i32* %arrayidx.i2194.i, align 4
  br i1 %528, label %do.body823.i, label %do.body836.i

do.body823.i:                                     ; preds = %st.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %conv1.i2195.i = add i32 %532, 64
  %conv825.i = and i32 %conv1.i2195.i, 255
  %shl828.i = shl nsw i32 %conv820.i, 8
  %add829.i = or i32 %conv825.i, %shl828.i
  %conv4.i2190.i = trunc i32 %add829.i to i16
  %533 = bitcast i8* %530 to i16*
  %534 = ptrtoint i16* %533 to i64
  call void @__asan_store2_noabort(i64 %534)
  store i16 %conv4.i2190.i, i16* %533, align 2
  br label %do.body853.i

do.body836.i:                                     ; preds = %st.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %535 = trunc i32 %532 to i8
  %conv1.i2189.i = xor i8 %535, -128
  %536 = ptrtoint i8* %530 to i64
  call void @__asan_store1_noabort(i64 %536)
  store i8 %conv1.i2189.i, i8* %530, align 1
  %add.ptr.i2186.i = getelementptr i8, i8* %530, i64 1
  %537 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %537)
  store i8* %add.ptr.i2186.i, i8** %prog.i, align 8
  %538 = ptrtoint i16* %off.i to i64
  call void @__asan_load2_noabort(i64 %538)
  %539 = load i16, i16* %off.i, align 2
  %conv845.i = sext i16 %539 to i32
  %540 = bitcast i8* %add.ptr.i2186.i to i32*
  %541 = ptrtoint i32* %540 to i64
  call void @__asan_store4_noabort(i64 %541)
  store i32 %conv845.i, i32* %540, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  br label %do.body853.i

do.body853.i:                                     ; preds = %do.body836.i, %do.body823.i
  %.sink631 = phi i64 [ 5, %do.body836.i ], [ 2, %do.body823.i ]
  %add.ptr.i2182.i = getelementptr i8, i8* %530, i64 %.sink631
  %542 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %542)
  store i8* %add.ptr.i2182.i, i8** %prog.i, align 8
  %543 = ptrtoint i8* %code.i to i64
  call void @__asan_load1_noabort(i64 %543)
  %544 = load i8, i8* %code.i, align 4
  %545 = lshr i8 %544, 3
  %546 = and i8 %545, 3
  %547 = zext i8 %546 to i32
  %548 = zext i32 %547 to i64
  call void @__sanitizer_cov_trace_switch(i64 %548, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__sancov_gen_cov_switch_values.29, i32 0, i32 0))
  switch i32 %547, label %if.else9.i21782483.i [
    i32 0, label %do.body853.i.if.else5.i.i_crit_edge
    i32 1, label %if.then3.i.i
    i32 2, label %if.then.i2168.i
    i32 3, label %do.body853.i.if.else5.i.i_crit_edge867
  ]

do.body853.i.if.else5.i.i_crit_edge867:           ; preds = %do.body853.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.else5.i.i

do.body853.i.if.else5.i.i_crit_edge:              ; preds = %do.body853.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.else5.i.i

if.else9.i21782483.i:                             ; preds = %do.body853.i
  unreachable

if.then.i2168.i:                                  ; preds = %do.body853.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %conv.i2167.i = trunc i32 %69 to i8
  %549 = ptrtoint i8* %add.ptr.i2182.i to i64
  call void @__asan_store1_noabort(i64 %549)
  store i8 %conv.i2167.i, i8* %add.ptr.i2182.i, align 1
  br label %emit_code.exit.i

if.then3.i.i:                                     ; preds = %do.body853.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %conv4.i2169.i = trunc i32 %69 to i16
  %550 = bitcast i8* %add.ptr.i2182.i to i16*
  %551 = ptrtoint i16* %550 to i64
  call void @__asan_store2_noabort(i64 %551)
  store i16 %conv4.i2169.i, i16* %550, align 2
  br label %emit_code.exit.i

if.else5.i.i:                                     ; preds = %do.body853.i.if.else5.i.i_crit_edge867, %do.body853.i.if.else5.i.i_crit_edge
  %552 = bitcast i8* %add.ptr.i2182.i to i32*
  %553 = ptrtoint i32* %552 to i64
  call void @__asan_store4_noabort(i64 %553)
  store i32 %69, i32* %552, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  br label %emit_code.exit.i

emit_code.exit.i:                                 ; preds = %if.else5.i.i, %if.then3.i.i, %if.then.i2168.i
  %retval.0.i21792458.i = phi i64 [ 1, %if.then.i2168.i ], [ 2, %if.then3.i.i ], [ 4, %if.else5.i.i ]
  %add.ptr.i2171.i = getelementptr i8, i8* %add.ptr.i2182.i, i64 %retval.0.i21792458.i
  %554 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %554)
  store i8* %add.ptr.i2171.i, i8** %prog.i, align 8
  br label %sw.epilog1406.i

sw.bb866.i:                                       ; preds = %for.body.i.sw.bb866.i_crit_edge819, %for.body.i.sw.bb866.i_crit_edge818, %for.body.i.sw.bb866.i_crit_edge817, %for.body.i.sw.bb866.i_crit_edge
  %555 = and i8 %72, 24
  %and869.i = zext i8 %555 to i32
  %off870.i = getelementptr inbounds %struct.bpf_insn, %struct.bpf_insn* %insn.02525.i, i64 0, i32 2
  %556 = ptrtoint i16* %off870.i to i64
  call void @__asan_load2_noabort(i64 %556)
  %557 = load i16, i16* %off870.i, align 2
  %conv871.i = sext i16 %557 to i32
  call fastcc void @emit_stx(i8** nonnull %prog.i, i32 %and869.i, i32 %conv5.i, i32 %conv8.i, i32 %conv871.i) #13
  br label %sw.epilog1406.i

sw.bb872.i:                                       ; preds = %for.body.i.sw.bb872.i_crit_edge826, %for.body.i.sw.bb872.i_crit_edge825, %for.body.i.sw.bb872.i_crit_edge824, %for.body.i.sw.bb872.i_crit_edge823, %for.body.i.sw.bb872.i_crit_edge822, %for.body.i.sw.bb872.i_crit_edge821, %for.body.i.sw.bb872.i_crit_edge820, %for.body.i.sw.bb872.i_crit_edge
  %558 = and i8 %72, 24
  %and875.i = zext i8 %558 to i32
  %off876.i = getelementptr inbounds %struct.bpf_insn, %struct.bpf_insn* %insn.02525.i, i64 0, i32 2
  %559 = ptrtoint i16* %off876.i to i64
  call void @__asan_load2_noabort(i64 %559)
  %560 = load i16, i16* %off876.i, align 2
  %conv877.i = sext i16 %560 to i32
  call fastcc void @emit_ldx(i8** nonnull %prog.i, i32 %and875.i, i32 %conv5.i, i32 %conv8.i, i32 %conv877.i) #13
  %561 = ptrtoint i8* %code.i to i64
  call void @__asan_load1_noabort(i64 %561)
  %562 = load i8, i8* %code.i, align 4
  %563 = and i8 %562, -32
  call void @__sanitizer_cov_trace_const_cmp1(i8 32, i8 %563)
  %cmp881.i = icmp eq i8 %563, 32
  br i1 %cmp881.i, label %if.then883.i, label %sw.bb872.i.sw.epilog1406.i_crit_edge

sw.bb872.i.sw.epilog1406.i_crit_edge:             ; preds = %sw.bb872.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.epilog1406.i

if.then883.i:                                     ; preds = %sw.bb872.i
  %idx.ext.i = sext i32 %proglen.02544.i to i64
  %add.ptr.i = getelementptr i8, i8* %.pr409, i64 %idx.ext.i
  %564 = ptrtoint %struct.bpf_prog_aux** %aux to i64
  call void @__asan_load8_noabort(i64 %564)
  %565 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %aux, align 8
  %extable.i = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %565, i64 0, i32 45
  %566 = ptrtoint %struct.exception_table_entry** %extable.i to i64
  call void @__asan_load8_noabort(i64 %566)
  %567 = load %struct.exception_table_entry*, %struct.exception_table_entry** %extable.i, align 8
  %tobool885.i = icmp eq %struct.exception_table_entry* %567, null
  br i1 %tobool885.i, label %if.then883.i.sw.epilog1406.i_crit_edge, label %if.end887.i

if.then883.i.sw.epilog1406.i_crit_edge:           ; preds = %if.then883.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.epilog1406.i

if.end887.i:                                      ; preds = %if.then883.i
  %num_exentries.i = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %565, i64 0, i32 44
  %568 = ptrtoint i32* %num_exentries.i to i64
  call void @__asan_load4_noabort(i64 %568)
  %569 = load i32, i32* %num_exentries.i, align 4
  call void @__sanitizer_cov_trace_cmp4(i32 %excnt.02541.i, i32 %569)
  %cmp889.i = icmp ult i32 %excnt.02541.i, %569
  br i1 %cmp889.i, label %if.end893.i, label %if.then891.i

if.then891.i:                                     ; preds = %if.end887.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %call892.i = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.5, i64 0, i64 0)) #16
  br label %do_jit.exit.thread

if.end893.i:                                      ; preds = %if.end887.i
  %inc896.i = add nuw i32 %excnt.02541.i, 1
  %idxprom.i = sext i32 %excnt.02541.i to i64
  %arrayidx897.i = getelementptr %struct.exception_table_entry, %struct.exception_table_entry* %567, i64 %idxprom.i
  %sub.ptr.lhs.cast899.i = ptrtoint i8* %add.ptr.i to i64
  %sub.ptr.rhs.cast900.i = ptrtoint %struct.exception_table_entry* %arrayidx897.i to i64
  %sub.ptr.sub901.i = sub i64 %sub.ptr.lhs.cast899.i, %sub.ptr.rhs.cast900.i
  %570 = add i64 %sub.ptr.sub901.i, 2147483648
  call void @__sanitizer_cov_trace_const_cmp8(i64 4294967296, i64 %570)
  %571 = icmp ult i64 %570, 4294967296
  br i1 %571, label %if.end905.i, label %if.then903.i

if.then903.i:                                     ; preds = %if.end893.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %call904.i = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.6, i64 0, i64 0)) #16
  br label %do_jit.exit.thread

if.end905.i:                                      ; preds = %if.end893.i
  %insn898.i = getelementptr inbounds %struct.exception_table_entry, %struct.exception_table_entry* %arrayidx897.i, i64 0, i32 0
  %conv906.i = trunc i64 %sub.ptr.sub901.i to i32
  %572 = ptrtoint i32* %insn898.i to i64
  call void @__asan_store4_noabort(i64 %572)
  store i32 %conv906.i, i32* %insn898.i, align 4
  %handler.i = getelementptr %struct.exception_table_entry, %struct.exception_table_entry* %567, i64 %idxprom.i, i32 2
  %sub.ptr.rhs.cast908.i = ptrtoint i32* %handler.i to i64
  %573 = sub i64 add (i64 ptrtoint (i1 (%struct.exception_table_entry*, %struct.pt_regs*, i32, i64, i64)* @ex_handler_bpf to i64), i64 2147483648), %sub.ptr.rhs.cast908.i
  call void @__sanitizer_cov_trace_const_cmp8(i64 4294967296, i64 %573)
  %574 = icmp ult i64 %573, 4294967296
  br i1 %574, label %if.end913.i, label %if.then911.i

if.then911.i:                                     ; preds = %if.end905.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %call912.i = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.7, i64 0, i64 0)) #16
  br label %do_jit.exit.thread

if.end913.i:                                      ; preds = %if.end905.i
  %575 = trunc i64 %sub.ptr.rhs.cast908.i to i32
  %conv914.i = sub i32 ptrtoint (i1 (%struct.exception_table_entry*, %struct.pt_regs*, i32, i64, i64)* @ex_handler_bpf to i32), %575
  %576 = ptrtoint i32* %handler.i to i64
  call void @__asan_store4_noabort(i64 %576)
  store i32 %conv914.i, i32* %handler.i, align 4
  call void @__sanitizer_cov_trace_const_cmp1(i8 9, i8 %bf.clear.i)
  %cmp916.i = icmp ugt i8 %bf.clear.i, 9
  br i1 %cmp916.i, label %if.then918.i, label %if.end920.i

if.then918.i:                                     ; preds = %if.end913.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %call919.i = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.8, i64 0, i64 0)) #16
  br label %do_jit.exit.thread

if.end920.i:                                      ; preds = %if.end913.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %577 = ptrtoint i64* %43 to i64
  call void @__asan_load8_noabort(i64 %577)
  %578 = load i64, i64* %43, align 8
  %sub.ptr.sub924.i = sub i64 %578, %sub.ptr.rhs.cast.i
  %idxprom925.i = zext i8 %bf.clear.i to i64
  %arrayidx926.i = getelementptr [10 x i32], [10 x i32]* @reg2pt_regs, i64 0, i64 %idxprom925.i
  %579 = ptrtoint i32* %arrayidx926.i to i64
  call void @__asan_load4_noabort(i64 %579)
  %580 = load i32, i32* %arrayidx926.i, align 4
  %shl927.i = shl i32 %580, 8
  %581 = trunc i64 %sub.ptr.sub924.i to i32
  %conv929.i = or i32 %shl927.i, %581
  %fixup.i = getelementptr %struct.exception_table_entry, %struct.exception_table_entry* %567, i64 %idxprom.i, i32 1
  %582 = ptrtoint i32* %fixup.i to i64
  call void @__asan_store4_noabort(i64 %582)
  store i32 %conv929.i, i32* %fixup.i, align 4
  br label %sw.epilog1406.i

sw.bb933.i:                                       ; preds = %for.body.i
  %shl.i2157.i = shl nuw nsw i32 1, %conv5.i
  %583 = and i32 %shl.i2157.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %583)
  %tobool.i2158.i = icmp ne i32 %583, 0
  %.pre2561.i = shl nuw nsw i32 1, %conv8.i
  %.pre2562.i = and i32 %.pre2561.i, 27552
  %tobool.i2158.not.i = xor i1 %tobool.i2158.i, true
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %.pre2562.i)
  %tobool.i2156.i = icmp eq i32 %.pre2562.i, 0
  %or.cond2587.i = and i1 %tobool.i2156.i, %tobool.i2158.not.i
  %584 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %584)
  %585 = load i8*, i8** %prog.i, align 8
  br i1 %or.cond2587.i, label %do.body951.i, label %do.body940.i

do.body940.i:                                     ; preds = %sw.bb933.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %586 = zext i1 %tobool.i2158.i to i32
  %byte.addr.1.i2154.v.i = select i1 %tobool.i2156.i, i32 64, i32 68
  %byte.addr.1.i2154.i = or i32 %byte.addr.1.i2154.v.i, %586
  %shl943.i = shl nuw nsw i32 %byte.addr.1.i2154.i, 8
  %add945.i = or i32 %shl943.i, 65776
  %587 = bitcast i8* %585 to i32*
  %588 = ptrtoint i32* %587 to i64
  call void @__asan_store4_noabort(i64 %588)
  store i32 %add945.i, i32* %587, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i2146.i = getelementptr i8, i8* %585, i64 3
  %589 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %589)
  store i8* %add.ptr.i2146.i, i8** %prog.i, align 8
  br label %xadd.i

do.body951.i:                                     ; preds = %sw.bb933.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %590 = bitcast i8* %585 to i16*
  %591 = ptrtoint i16* %590 to i64
  call void @__asan_store2_noabort(i64 %591)
  store i16 496, i16* %590, align 2
  %add.ptr.i2145.i = getelementptr i8, i8* %585, i64 2
  %592 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %592)
  store i8* %add.ptr.i2145.i, i8** %prog.i, align 8
  br label %xadd.i

do.body958.i:                                     ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %593 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %593)
  %594 = load i8*, i8** %prog.i, align 8
  %shl.i.i2139.i = shl nuw nsw i32 1, %conv5.i
  %595 = and i32 %shl.i.i2139.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %595)
  %tobool.i.i2140.i = icmp ne i32 %595, 0
  %596 = zext i1 %tobool.i.i2140.i to i32
  %shl.i10.i2142.i = shl nuw nsw i32 1, %conv8.i
  %597 = and i32 %shl.i10.i2142.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %597)
  %tobool.i11.i2143.i = icmp eq i32 %597, 0
  %byte.addr.1.i2144.v.i = select i1 %tobool.i11.i2143.i, i32 72, i32 76
  %byte.addr.1.i2144.i = or i32 %byte.addr.1.i2144.v.i, %596
  %shl961.i = shl nuw nsw i32 %byte.addr.1.i2144.i, 8
  %add963.i = or i32 %shl961.i, 65776
  %598 = bitcast i8* %594 to i32*
  %599 = ptrtoint i32* %598 to i64
  call void @__asan_store4_noabort(i64 %599)
  store i32 %add963.i, i32* %598, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i2132.i = getelementptr i8, i8* %594, i64 3
  %600 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %600)
  store i8* %add.ptr.i2132.i, i8** %prog.i, align 8
  br label %xadd.i

xadd.i:                                           ; preds = %do.body958.i, %do.body951.i, %do.body940.i
  %off968.i = getelementptr inbounds %struct.bpf_insn, %struct.bpf_insn* %insn.02525.i, i64 0, i32 2
  %601 = ptrtoint i16* %off968.i to i64
  call void @__asan_load2_noabort(i64 %601)
  %602 = load i16, i16* %off968.i, align 2
  %conv969.i = sext i16 %602 to i32
  %value.off.i2131.i = add nsw i32 %conv969.i, 128
  call void @__sanitizer_cov_trace_const_cmp4(i32 256, i32 %value.off.i2131.i)
  %603 = icmp ult i32 %value.off.i2131.i, 256
  %604 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %604)
  %605 = load i8*, i8** %prog.i, align 8
  %idxprom.i2123.i = zext i8 %bf.clear.i to i64
  %arrayidx.i2124.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom.i2123.i
  %606 = ptrtoint i32* %arrayidx.i2124.i to i64
  call void @__asan_load4_noabort(i64 %606)
  %607 = load i32, i32* %arrayidx.i2124.i, align 4
  br i1 %603, label %do.body972.i, label %do.body985.i

do.body972.i:                                     ; preds = %xadd.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %add.i2125.i = add i32 %607, 64
  %idxprom1.i2126.i = zext i8 %bf.lshr.i to i64
  %arrayidx2.i2127.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom1.i2126.i
  %608 = ptrtoint i32* %arrayidx2.i2127.i to i64
  call void @__asan_load4_noabort(i64 %608)
  %609 = load i32, i32* %arrayidx2.i2127.i, align 4
  %shl.i2128.i = shl i32 %609, 3
  %add3.i2129.i = add i32 %add.i2125.i, %shl.i2128.i
  %conv974.i = and i32 %add3.i2129.i, 255
  %shl977.i = shl nsw i32 %conv969.i, 8
  %add978.i = or i32 %conv974.i, %shl977.i
  %conv4.i2121.i = trunc i32 %add978.i to i16
  %610 = bitcast i8* %605 to i16*
  %611 = ptrtoint i16* %610 to i64
  call void @__asan_store2_noabort(i64 %611)
  store i16 %conv4.i2121.i, i16* %610, align 2
  %add.ptr.i2122.i = getelementptr i8, i8* %605, i64 2
  %612 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %612)
  store i8* %add.ptr.i2122.i, i8** %prog.i, align 8
  br label %sw.epilog1406.i

do.body985.i:                                     ; preds = %xadd.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %add.i2115.i = add i32 %607, 128
  %idxprom1.i2116.i = zext i8 %bf.lshr.i to i64
  %arrayidx2.i2117.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom1.i2116.i
  %613 = ptrtoint i32* %arrayidx2.i2117.i to i64
  call void @__asan_load4_noabort(i64 %613)
  %614 = load i32, i32* %arrayidx2.i2117.i, align 4
  %shl.i2118.i = shl i32 %614, 3
  %add3.i2119.i = add i32 %add.i2115.i, %shl.i2118.i
  %conv4.i2120.i = trunc i32 %add3.i2119.i to i8
  %615 = ptrtoint i8* %605 to i64
  call void @__asan_store1_noabort(i64 %615)
  store i8 %conv4.i2120.i, i8* %605, align 1
  %add.ptr.i2112.i = getelementptr i8, i8* %605, i64 1
  %616 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %616)
  store i8* %add.ptr.i2112.i, i8** %prog.i, align 8
  %617 = ptrtoint i16* %off968.i to i64
  call void @__asan_load2_noabort(i64 %617)
  %618 = load i16, i16* %off968.i, align 2
  %conv994.i = sext i16 %618 to i32
  %619 = bitcast i8* %add.ptr.i2112.i to i32*
  %620 = ptrtoint i32* %619 to i64
  call void @__asan_store4_noabort(i64 %620)
  store i32 %conv994.i, i32* %619, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i2108.i = getelementptr i8, i8* %605, i64 5
  %621 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %621)
  store i8* %add.ptr.i2108.i, i8** %prog.i, align 8
  br label %sw.epilog1406.i

sw.bb1002.i:                                      ; preds = %for.body.i
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %69)
  %tobool1005.i = icmp eq i32 %69, 0
  br i1 %tobool1005.i, label %sw.bb1002.i.do_jit.exit.thread_crit_edge, label %lor.lhs.false1006.i

sw.bb1002.i.do_jit.exit.thread_crit_edge:         ; preds = %sw.bb1002.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do_jit.exit.thread

lor.lhs.false1006.i:                              ; preds = %sw.bb1002.i
  %idx.ext1003.i = sext i32 %69 to i64
  %add.ptr1004.i = getelementptr i8, i8* bitcast (i64 (i64, i64, i64, i64, i64)* @__bpf_call_base to i8*), i64 %idx.ext1003.i
  %sub.i = add i32 %i.02531.i, -1
  %idxprom1007.i = sext i32 %sub.i to i64
  %arrayidx1008.i = getelementptr i32, i32* %addrs.0, i64 %idxprom1007.i
  %622 = ptrtoint i32* %arrayidx1008.i to i64
  call void @__asan_load4_noabort(i64 %622)
  %623 = load i32, i32* %arrayidx1008.i, align 4
  %idx.ext1009.i = sext i32 %623 to i64
  %624 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %624)
  %625 = load i8*, i8** %prog.i, align 8
  %add.ptr.i.i2055.i = getelementptr i8, i8* %add.ptr1010.i, i64 %idx.ext1009.i
  %sub.ptr.lhs.cast.i.i.i = ptrtoint i8* %add.ptr1004.i to i64
  %sub.ptr.rhs.cast.i.i.i = ptrtoint i8* %add.ptr.i.i2055.i to i64
  %sub.ptr.sub.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i, %sub.ptr.rhs.cast.i.i.i
  %626 = add i64 %sub.ptr.sub.i.i.i, 2147483648
  call void @__sanitizer_cov_trace_const_cmp8(i64 4294967296, i64 %626)
  %627 = icmp ult i64 %626, 4294967296
  br i1 %627, label %emit_call.exit.thread.i, label %emit_call.exit.i

emit_call.exit.thread.i:                          ; preds = %lor.lhs.false1006.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %628 = ptrtoint i8* %625 to i64
  call void @__asan_store1_noabort(i64 %628)
  store i8 -24, i8* %625, align 1
  %add.ptr.i23.i.i.i = getelementptr i8, i8* %625, i64 1
  %conv5.i.i.i = trunc i64 %sub.ptr.sub.i.i.i to i32
  %629 = bitcast i8* %add.ptr.i23.i.i.i to i32*
  %630 = ptrtoint i32* %629 to i64
  call void @__asan_store4_noabort(i64 %630)
  store i32 %conv5.i.i.i, i32* %629, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i.i.i.i = getelementptr i8, i8* %625, i64 5
  %631 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %631)
  store i8* %add.ptr.i.i.i.i, i8** %prog.i, align 8
  br label %sw.epilog1406.i

emit_call.exit.i:                                 ; preds = %lor.lhs.false1006.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %call1.i.i.i = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.2, i64 0, i64 0), i8* %add.ptr1004.i) #16
  br label %do_jit.exit.thread

sw.bb1015.i:                                      ; preds = %for.body.i
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %69)
  %tobool1016.i = icmp eq i32 %69, 0
  br i1 %tobool1016.i, label %if.else1024.i, label %if.then1017.i

if.then1017.i:                                    ; preds = %sw.bb1015.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %632 = ptrtoint %struct.bpf_prog_aux** %aux to i64
  call void @__asan_load8_noabort(i64 %632)
  %633 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %aux, align 8
  %poke_tab.i = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %633, i64 0, i32 24
  %634 = ptrtoint %struct.bpf_jit_poke_descriptor** %poke_tab.i to i64
  call void @__asan_load8_noabort(i64 %634)
  %635 = load %struct.bpf_jit_poke_descriptor*, %struct.bpf_jit_poke_descriptor** %poke_tab.i, align 8
  %sub1019.i = add i32 %69, -1
  %idxprom1020.i = sext i32 %sub1019.i to i64
  %idxprom1022.i = sext i32 %i.02531.i to i64
  %arrayidx1023.i = getelementptr i32, i32* %addrs.0, i64 %idxprom1022.i
  %636 = ptrtoint i32* %arrayidx1023.i to i64
  call void @__asan_load4_noabort(i64 %636)
  %637 = load i32, i32* %arrayidx1023.i, align 4
  %638 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %638)
  %639 = load i8*, i8** %prog.i, align 8
  %640 = bitcast i8* %639 to i16*
  %641 = ptrtoint i16* %640 to i64
  call void @__asan_store2_noabort(i64 %641)
  store i16 -31349, i16* %640, align 2
  %add.ptr.i.i2038.i = getelementptr i8, i8* %639, i64 2
  %642 = bitcast i8* %add.ptr.i.i2038.i to i32*
  %643 = ptrtoint i32* %642 to i64
  call void @__asan_store4_noabort(i64 %643)
  store i32 -548, i32* %642, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i59.i.i = getelementptr i8, i8* %639, i64 6
  %644 = bitcast i8* %add.ptr.i59.i.i to i32*
  %645 = ptrtoint i32* %644 to i64
  call void @__asan_store4_noabort(i64 %645)
  store i32 2160771, i32* %644, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i60.i.i = getelementptr i8, i8* %639, i64 9
  %646 = bitcast i8* %add.ptr.i60.i.i to i16*
  %647 = ptrtoint i16* %646 to i64
  call void @__asan_store2_noabort(i64 %647)
  store i16 3703, i16* %646, align 2
  %add.ptr.i61.i2039.i = getelementptr i8, i8* %639, i64 11
  %648 = bitcast i8* %add.ptr.i61.i2039.i to i32*
  %649 = ptrtoint i32* %648 to i64
  call void @__asan_store4_noabort(i64 %649)
  store i32 114819, i32* %648, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i63.i.i = getelementptr i8, i8* %639, i64 14
  %650 = bitcast i8* %add.ptr.i63.i.i to i16*
  %651 = ptrtoint i16* %650 to i64
  call void @__asan_store2_noabort(i64 %651)
  store i16 -31351, i16* %650, align 2
  %add.ptr.i62.i.i = getelementptr i8, i8* %639, i64 16
  %652 = bitcast i8* %add.ptr.i62.i.i to i32*
  %653 = ptrtoint i32* %652 to i64
  call void @__asan_store4_noabort(i64 %653)
  store i32 -548, i32* %652, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i58.i.i = getelementptr i8, i8* %639, i64 20
  %sub.i2040.i = add i32 %637, -5
  %idx.ext.i.i = sext i32 %sub.i2040.i to i64
  %add.ptr.i2041.i = getelementptr i8, i8* %.pr409, i64 %idx.ext.i.i
  %ip.i.i = getelementptr %struct.bpf_jit_poke_descriptor, %struct.bpf_jit_poke_descriptor* %635, i64 %idxprom1020.i, i32 0
  %654 = ptrtoint i8** %ip.i.i to i64
  call void @__asan_store8_noabort(i64 %654)
  store i8* %add.ptr.i2041.i, i8** %ip.i.i, align 8
  %adj_off.i.i = getelementptr %struct.bpf_jit_poke_descriptor, %struct.bpf_jit_poke_descriptor* %635, i64 %idxprom1020.i, i32 3
  %655 = ptrtoint i8* %adj_off.i.i to i64
  call void @__asan_store1_noabort(i64 %655)
  store i8 25, i8* %adj_off.i.i, align 1
  call void @__asan_load8_noabort(i64 ptrtoint (i8*** @ideal_nops to i64))
  %656 = load i8**, i8*** @ideal_nops, align 8
  %arrayidx.i2042.i = getelementptr i8*, i8** %656, i64 9
  %657 = ptrtoint i8** %arrayidx.i2042.i to i64
  call void @__asan_load8_noabort(i64 %657)
  %658 = load i8*, i8** %arrayidx.i2042.i, align 8
  %call37.i.i = call i8* @memcpy(i8* %add.ptr.i58.i.i, i8* %658, i64 5) #13
  %add.ptr38.i.i = getelementptr i8, i8* %639, i64 25
  %659 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %659)
  store i8* %add.ptr38.i.i, i8** %prog.i, align 8
  br label %sw.epilog1406.i

if.else1024.i:                                    ; preds = %sw.bb1015.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %660 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %660)
  %661 = load i8*, i8** %prog.i, align 8
  %662 = bitcast i8* %661 to i16*
  %663 = ptrtoint i16* %662 to i64
  call void @__asan_store2_noabort(i64 %663)
  store i16 -11639, i16* %662, align 2
  %add.ptr.i.i2003.i = getelementptr i8, i8* %661, i64 2
  %664 = bitcast i8* %add.ptr.i.i2003.i to i32*
  %665 = ptrtoint i32* %664 to i64
  call void @__asan_store4_noabort(i64 %665)
  store i32 2381369, i32* %664, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i202.i.i = getelementptr i8, i8* %661, i64 5
  %666 = bitcast i8* %add.ptr.i202.i.i to i16*
  %667 = ptrtoint i16* %666 to i64
  call void @__asan_store2_noabort(i64 %667)
  store i16 14966, i16* %666, align 2
  %add.ptr.i203.i.i = getelementptr i8, i8* %661, i64 7
  %668 = bitcast i8* %add.ptr.i203.i.i to i16*
  %669 = ptrtoint i16* %668 to i64
  call void @__asan_store2_noabort(i64 %669)
  store i16 -31349, i16* %668, align 2
  %add.ptr.i206.i.i = getelementptr i8, i8* %661, i64 9
  %670 = bitcast i8* %add.ptr.i206.i.i to i32*
  %671 = ptrtoint i32* %670 to i64
  call void @__asan_store4_noabort(i64 %671)
  store i32 -548, i32* %670, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i209.i.i = getelementptr i8, i8* %661, i64 13
  %672 = bitcast i8* %add.ptr.i209.i.i to i32*
  %673 = ptrtoint i32* %672 to i64
  call void @__asan_store4_noabort(i64 %673)
  store i32 2160771, i32* %672, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i210.i.i = getelementptr i8, i8* %661, i64 16
  %674 = bitcast i8* %add.ptr.i210.i.i to i16*
  %675 = ptrtoint i16* %674 to i64
  call void @__asan_store2_noabort(i64 %675)
  store i16 12151, i16* %674, align 2
  %add.ptr.i211.i.i = getelementptr i8, i8* %661, i64 18
  %676 = bitcast i8* %add.ptr.i211.i.i to i32*
  %677 = ptrtoint i32* %676 to i64
  call void @__asan_store4_noabort(i64 %677)
  store i32 114819, i32* %676, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i214.i.i = getelementptr i8, i8* %661, i64 21
  %678 = bitcast i8* %add.ptr.i214.i.i to i16*
  %679 = ptrtoint i16* %678 to i64
  call void @__asan_store2_noabort(i64 %679)
  store i16 -31351, i16* %678, align 2
  %add.ptr.i215.i.i = getelementptr i8, i8* %661, i64 23
  %680 = bitcast i8* %add.ptr.i215.i.i to i32*
  %681 = ptrtoint i32* %680 to i64
  call void @__asan_store4_noabort(i64 %681)
  store i32 -548, i32* %680, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i217.i.i = getelementptr i8, i8* %661, i64 27
  %682 = bitcast i8* %add.ptr.i217.i.i to i32*
  %683 = ptrtoint i32* %682 to i64
  call void @__asan_store4_noabort(i64 %683)
  store i32 -695956664, i32* %682, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i218.i.i = getelementptr i8, i8* %661, i64 31
  %684 = bitcast i8* %add.ptr.i218.i.i to i32*
  %685 = ptrtoint i32* %684 to i64
  call void @__asan_store4_noabort(i64 %685)
  store i32 464, i32* %684, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i219.i.i = getelementptr i8, i8* %661, i64 35
  %686 = bitcast i8* %add.ptr.i219.i.i to i32*
  %687 = ptrtoint i32* %686 to i64
  call void @__asan_store4_noabort(i64 %687)
  store i32 12617032, i32* %686, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i220.i.i = getelementptr i8, i8* %661, i64 38
  %688 = bitcast i8* %add.ptr.i220.i.i to i16*
  %689 = ptrtoint i16* %688 to i64
  call void @__asan_store2_noabort(i64 %689)
  store i16 6516, i16* %688, align 2
  %add.ptr.i221.i.i = getelementptr i8, i8* %661, i64 40
  %690 = bitcast i8* %add.ptr.i221.i.i to i32*
  %691 = ptrtoint i32* %690 to i64
  call void @__asan_store4_noabort(i64 %691)
  store i32 809536328, i32* %690, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i216.i.i = getelementptr i8, i8* %661, i64 44
  %692 = bitcast i8* %add.ptr.i216.i.i to i32*
  %693 = ptrtoint i32* %692 to i64
  call void @__asan_store4_noabort(i64 %693)
  store i32 432046920, i32* %692, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i213.i.i = getelementptr i8, i8* %661, i64 48
  %694 = ptrtoint i8* %add.ptr.i213.i.i to i64
  call void @__asan_store1_noabort(i64 %694)
  store i8 -24, i8* %add.ptr.i213.i.i, align 1
  %add.ptr.i212.i.i = getelementptr i8, i8* %661, i64 49
  %695 = bitcast i8* %add.ptr.i212.i.i to i32*
  %696 = ptrtoint i32* %695 to i64
  call void @__asan_store4_noabort(i64 %696)
  store i32 7, i32* %695, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i208.i.i = getelementptr i8, i8* %661, i64 53
  %697 = bitcast i8* %add.ptr.i208.i.i to i16*
  %698 = ptrtoint i16* %697 to i64
  call void @__asan_store2_noabort(i64 %698)
  store i16 -28429, i16* %697, align 2
  %add.ptr.i207.i.i = getelementptr i8, i8* %661, i64 55
  %699 = bitcast i8* %add.ptr.i207.i.i to i32*
  %700 = ptrtoint i32* %699 to i64
  call void @__asan_store4_noabort(i64 %700)
  store i32 15248911, i32* %699, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i205.i.i = getelementptr i8, i8* %661, i64 58
  %701 = bitcast i8* %add.ptr.i205.i.i to i16*
  %702 = ptrtoint i16* %701 to i64
  call void @__asan_store2_noabort(i64 %702)
  store i16 -1557, i16* %701, align 2
  %add.ptr.i204.i.i = getelementptr i8, i8* %661, i64 60
  %703 = bitcast i8* %add.ptr.i204.i.i to i32*
  %704 = ptrtoint i32* %703 to i64
  call void @__asan_store4_noabort(i64 %704)
  store i32 604277064, i32* %703, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i201.i.i = getelementptr i8, i8* %661, i64 64
  %705 = ptrtoint i8* %add.ptr.i201.i.i to i64
  call void @__asan_store1_noabort(i64 %705)
  store i8 -61, i8* %add.ptr.i201.i.i, align 1
  %add.ptr.i200.i.i = getelementptr i8, i8* %661, i64 65
  %706 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %706)
  store i8* %add.ptr.i200.i.i, i8** %prog.i, align 8
  br label %sw.epilog1406.i

sw.bb1026.i:                                      ; preds = %for.body.i.sw.bb1026.i_crit_edge845, %for.body.i.sw.bb1026.i_crit_edge844, %for.body.i.sw.bb1026.i_crit_edge843, %for.body.i.sw.bb1026.i_crit_edge842, %for.body.i.sw.bb1026.i_crit_edge841, %for.body.i.sw.bb1026.i_crit_edge840, %for.body.i.sw.bb1026.i_crit_edge839, %for.body.i.sw.bb1026.i_crit_edge838, %for.body.i.sw.bb1026.i_crit_edge837, %for.body.i.sw.bb1026.i_crit_edge836, %for.body.i.sw.bb1026.i_crit_edge835, %for.body.i.sw.bb1026.i_crit_edge834, %for.body.i.sw.bb1026.i_crit_edge833, %for.body.i.sw.bb1026.i_crit_edge832, %for.body.i.sw.bb1026.i_crit_edge831, %for.body.i.sw.bb1026.i_crit_edge830, %for.body.i.sw.bb1026.i_crit_edge829, %for.body.i.sw.bb1026.i_crit_edge828, %for.body.i.sw.bb1026.i_crit_edge827, %for.body.i.sw.bb1026.i_crit_edge
  %707 = and i8 %72, 7
  call void @__sanitizer_cov_trace_const_cmp1(i8 5, i8 %707)
  %cmp1030.i = icmp eq i8 %707, 5
  br i1 %cmp1030.i, label %do.body1033.i, label %if.else1040.i

do.body1033.i:                                    ; preds = %sw.bb1026.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %708 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %708)
  %709 = load i8*, i8** %prog.i, align 8
  %shl.i.i1997.i = shl nuw nsw i32 1, %conv5.i
  %710 = and i32 %shl.i.i1997.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %710)
  %tobool.i.i1998.i = icmp ne i32 %710, 0
  %711 = zext i1 %tobool.i.i1998.i to i8
  %shl.i10.i2000.i = shl nuw nsw i32 1, %conv8.i
  %712 = and i32 %shl.i10.i2000.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %712)
  %tobool.i11.i2001.i = icmp eq i32 %712, 0
  %byte.addr.1.i2002.v.i = select i1 %tobool.i11.i2001.i, i8 72, i8 76
  %byte.addr.1.i2002.i = or i8 %byte.addr.1.i2002.v.i, %711
  %713 = ptrtoint i8* %709 to i64
  call void @__asan_store1_noabort(i64 %713)
  store i8 %byte.addr.1.i2002.i, i8* %709, align 1
  %add.ptr.i1996.i = getelementptr i8, i8* %709, i64 1
  %714 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %714)
  store i8* %add.ptr.i1996.i, i8** %prog.i, align 8
  br label %do.body1056.i

if.else1040.i:                                    ; preds = %sw.bb1026.i
  %shl.i1994.i = shl nuw nsw i32 1, %conv5.i
  %715 = and i32 %shl.i1994.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %715)
  %tobool.i1995.i = icmp ne i32 %715, 0
  %.pre2564.i = shl nuw nsw i32 1, %conv8.i
  %.pre2565.i = and i32 %.pre2564.i, 27552
  %tobool.i1995.not.i = xor i1 %tobool.i1995.i, true
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %.pre2565.i)
  %tobool.i1993.i = icmp eq i32 %.pre2565.i, 0
  %or.cond2588.i = and i1 %tobool.i1993.i, %tobool.i1995.not.i
  br i1 %or.cond2588.i, label %if.else1040.i.do.body1056.i_crit_edge, label %do.body1047.i

if.else1040.i.do.body1056.i_crit_edge:            ; preds = %if.else1040.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body1056.i

do.body1047.i:                                    ; preds = %if.else1040.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %716 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %716)
  %717 = load i8*, i8** %prog.i, align 8
  %718 = zext i1 %tobool.i1995.i to i8
  %byte.addr.1.i1991.v.i = select i1 %tobool.i1993.i, i8 64, i8 68
  %byte.addr.1.i1991.i = or i8 %byte.addr.1.i1991.v.i, %718
  %719 = ptrtoint i8* %717 to i64
  call void @__asan_store1_noabort(i64 %719)
  store i8 %byte.addr.1.i1991.i, i8* %717, align 1
  %add.ptr.i1985.i = getelementptr i8, i8* %717, i64 1
  store i8* %add.ptr.i1985.i, i8** %prog.i, align 8
  br label %do.body1056.i

do.body1056.i:                                    ; preds = %if.else1040.i.do.body1056.i_crit_edge, %do.body1047.i, %do.body1033.i
  %720 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %720)
  %721 = load i8*, i8** %prog.i, align 8
  %idxprom.i1977.i = zext i8 %bf.clear.i to i64
  %arrayidx.i1978.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom.i1977.i
  %722 = ptrtoint i32* %arrayidx.i1978.i to i64
  call void @__asan_load4_noabort(i64 %722)
  %723 = load i32, i32* %arrayidx.i1978.i, align 4
  %add.i1979.i = add i32 %723, 192
  %idxprom1.i1980.i = zext i8 %bf.lshr.i to i64
  %arrayidx2.i1981.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom1.i1980.i
  %724 = ptrtoint i32* %arrayidx2.i1981.i to i64
  call void @__asan_load4_noabort(i64 %724)
  %725 = load i32, i32* %arrayidx2.i1981.i, align 4
  %shl.i1982.i = shl i32 %725, 3
  %add3.i1983.i = add i32 %add.i1979.i, %shl.i1982.i
  %add3.i1983.tr.i = trunc i32 %add3.i1983.i to i16
  %726 = shl i16 %add3.i1983.tr.i, 8
  %conv4.i1975.i = or i16 %726, 57
  %727 = bitcast i8* %721 to i16*
  %728 = ptrtoint i16* %727 to i64
  call void @__asan_store2_noabort(i64 %728)
  store i16 %conv4.i1975.i, i16* %727, align 2
  %add.ptr.i1976.i = getelementptr i8, i8* %721, i64 2
  store i8* %add.ptr.i1976.i, i8** %prog.i, align 8
  br label %emit_cond_jmp.i

sw.bb1065.i:                                      ; preds = %for.body.i.sw.bb1065.i_crit_edge846, %for.body.i.sw.bb1065.i_crit_edge
  %729 = and i8 %72, 7
  call void @__sanitizer_cov_trace_const_cmp1(i8 5, i8 %729)
  %cmp1069.i = icmp eq i8 %729, 5
  br i1 %cmp1069.i, label %do.body1072.i, label %if.else1079.i

do.body1072.i:                                    ; preds = %sw.bb1065.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %730 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %730)
  %731 = load i8*, i8** %prog.i, align 8
  %shl.i.i1969.i = shl nuw nsw i32 1, %conv5.i
  %732 = and i32 %shl.i.i1969.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %732)
  %tobool.i.i1970.i = icmp ne i32 %732, 0
  %733 = zext i1 %tobool.i.i1970.i to i8
  %shl.i10.i1972.i = shl nuw nsw i32 1, %conv8.i
  %734 = and i32 %shl.i10.i1972.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %734)
  %tobool.i11.i1973.i = icmp eq i32 %734, 0
  %byte.addr.1.i1974.v.i = select i1 %tobool.i11.i1973.i, i8 72, i8 76
  %byte.addr.1.i1974.i = or i8 %byte.addr.1.i1974.v.i, %733
  %735 = ptrtoint i8* %731 to i64
  call void @__asan_store1_noabort(i64 %735)
  store i8 %byte.addr.1.i1974.i, i8* %731, align 1
  %add.ptr.i1968.i = getelementptr i8, i8* %731, i64 1
  %736 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %736)
  store i8* %add.ptr.i1968.i, i8** %prog.i, align 8
  br label %do.body1095.i

if.else1079.i:                                    ; preds = %sw.bb1065.i
  %shl.i1966.i = shl nuw nsw i32 1, %conv5.i
  %737 = and i32 %shl.i1966.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %737)
  %tobool.i1967.i = icmp ne i32 %737, 0
  %.pre2567.i = shl nuw nsw i32 1, %conv8.i
  %.pre2568.i = and i32 %.pre2567.i, 27552
  %tobool.i1967.not.i = xor i1 %tobool.i1967.i, true
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %.pre2568.i)
  %tobool.i1965.i = icmp eq i32 %.pre2568.i, 0
  %or.cond2589.i = and i1 %tobool.i1965.i, %tobool.i1967.not.i
  br i1 %or.cond2589.i, label %if.else1079.i.do.body1095.i_crit_edge, label %do.body1086.i

if.else1079.i.do.body1095.i_crit_edge:            ; preds = %if.else1079.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body1095.i

do.body1086.i:                                    ; preds = %if.else1079.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %738 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %738)
  %739 = load i8*, i8** %prog.i, align 8
  %740 = zext i1 %tobool.i1967.i to i8
  %byte.addr.1.i1963.v.i = select i1 %tobool.i1965.i, i8 64, i8 68
  %byte.addr.1.i1963.i = or i8 %byte.addr.1.i1963.v.i, %740
  %741 = ptrtoint i8* %739 to i64
  call void @__asan_store1_noabort(i64 %741)
  store i8 %byte.addr.1.i1963.i, i8* %739, align 1
  %add.ptr.i1957.i = getelementptr i8, i8* %739, i64 1
  store i8* %add.ptr.i1957.i, i8** %prog.i, align 8
  br label %do.body1095.i

do.body1095.i:                                    ; preds = %if.else1079.i.do.body1095.i_crit_edge, %do.body1086.i, %do.body1072.i
  %742 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %742)
  %743 = load i8*, i8** %prog.i, align 8
  %idxprom.i1949.i = zext i8 %bf.clear.i to i64
  %arrayidx.i1950.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom.i1949.i
  %744 = ptrtoint i32* %arrayidx.i1950.i to i64
  call void @__asan_load4_noabort(i64 %744)
  %745 = load i32, i32* %arrayidx.i1950.i, align 4
  %add.i1951.i = add i32 %745, 192
  %idxprom1.i1952.i = zext i8 %bf.lshr.i to i64
  %arrayidx2.i1953.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom1.i1952.i
  %746 = ptrtoint i32* %arrayidx2.i1953.i to i64
  call void @__asan_load4_noabort(i64 %746)
  %747 = load i32, i32* %arrayidx2.i1953.i, align 4
  %shl.i1954.i = shl i32 %747, 3
  %add3.i1955.i = add i32 %add.i1951.i, %shl.i1954.i
  %add3.i1955.tr.i = trunc i32 %add3.i1955.i to i16
  %748 = shl i16 %add3.i1955.tr.i, 8
  %conv4.i1947.i = or i16 %748, 133
  %749 = bitcast i8* %743 to i16*
  %750 = ptrtoint i16* %749 to i64
  call void @__asan_store2_noabort(i64 %750)
  store i16 %conv4.i1947.i, i16* %749, align 2
  %add.ptr.i1948.i = getelementptr i8, i8* %743, i64 2
  store i8* %add.ptr.i1948.i, i8** %prog.i, align 8
  br label %emit_cond_jmp.i

sw.bb1104.i:                                      ; preds = %for.body.i.sw.bb1104.i_crit_edge847, %for.body.i.sw.bb1104.i_crit_edge
  %751 = and i8 %72, 7
  call void @__sanitizer_cov_trace_const_cmp1(i8 5, i8 %751)
  %cmp1108.i = icmp eq i8 %751, 5
  br i1 %cmp1108.i, label %do.body1111.i, label %if.else1118.i

do.body1111.i:                                    ; preds = %sw.bb1104.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %752 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %752)
  %753 = load i8*, i8** %prog.i, align 8
  %shl.i.i1944.i = shl nuw nsw i32 1, %conv5.i
  %754 = and i32 %shl.i.i1944.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %754)
  %tobool.i.i1945.i = icmp ne i32 %754, 0
  %755 = zext i1 %tobool.i.i1945.i to i8
  %spec.select.i1946.i = or i8 %755, 72
  %756 = ptrtoint i8* %753 to i64
  call void @__asan_store1_noabort(i64 %756)
  store i8 %spec.select.i1946.i, i8* %753, align 1
  %add.ptr.i1943.i = getelementptr i8, i8* %753, i64 1
  %757 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %757)
  store i8* %add.ptr.i1943.i, i8** %prog.i, align 8
  br label %do.body1131.i

if.else1118.i:                                    ; preds = %sw.bb1104.i
  %shl.i1941.i = shl nuw nsw i32 1, %conv5.i
  %758 = and i32 %shl.i1941.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %758)
  %tobool.i1942.i = icmp eq i32 %758, 0
  br i1 %tobool.i1942.i, label %if.else1118.i.do.body1131.i_crit_edge, label %do.body1121.i

if.else1118.i.do.body1131.i_crit_edge:            ; preds = %if.else1118.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body1131.i

do.body1121.i:                                    ; preds = %if.else1118.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %759 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %759)
  %760 = load i8*, i8** %prog.i, align 8
  %761 = ptrtoint i8* %760 to i64
  call void @__asan_store1_noabort(i64 %761)
  store i8 65, i8* %760, align 1
  %add.ptr.i1937.i = getelementptr i8, i8* %760, i64 1
  store i8* %add.ptr.i1937.i, i8** %prog.i, align 8
  br label %do.body1131.i

do.body1131.i:                                    ; preds = %if.else1118.i.do.body1131.i_crit_edge, %do.body1121.i, %do.body1111.i
  %762 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %762)
  %763 = load i8*, i8** %prog.i, align 8
  %idxprom.i1934.i = zext i8 %bf.clear.i to i64
  %arrayidx.i1935.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom.i1934.i
  %764 = ptrtoint i32* %arrayidx.i1935.i to i64
  call void @__asan_load4_noabort(i64 %764)
  %765 = load i32, i32* %arrayidx.i1935.i, align 4
  %.tr2488.i = trunc i32 %765 to i16
  %766 = shl i16 %.tr2488.i, 8
  %767 = add i16 %766, -16384
  %conv4.i1932.i = or i16 %767, 247
  %768 = bitcast i8* %763 to i16*
  %769 = ptrtoint i16* %768 to i64
  call void @__asan_store2_noabort(i64 %769)
  store i16 %conv4.i1932.i, i16* %768, align 2
  %add.ptr.i1933.i = getelementptr i8, i8* %763, i64 2
  store i8* %add.ptr.i1933.i, i8** %prog.i, align 8
  %770 = bitcast i8* %add.ptr.i1933.i to i32*
  %771 = ptrtoint i32* %770 to i64
  call void @__asan_store4_noabort(i64 %771)
  store i32 %69, i32* %770, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i1929.i = getelementptr i8, i8* %763, i64 6
  %772 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %772)
  store i8* %add.ptr.i1929.i, i8** %prog.i, align 8
  br label %emit_cond_jmp.i

sw.bb1147.i:                                      ; preds = %for.body.i.sw.bb1147.i_crit_edge866, %for.body.i.sw.bb1147.i_crit_edge865, %for.body.i.sw.bb1147.i_crit_edge864, %for.body.i.sw.bb1147.i_crit_edge863, %for.body.i.sw.bb1147.i_crit_edge862, %for.body.i.sw.bb1147.i_crit_edge861, %for.body.i.sw.bb1147.i_crit_edge860, %for.body.i.sw.bb1147.i_crit_edge859, %for.body.i.sw.bb1147.i_crit_edge858, %for.body.i.sw.bb1147.i_crit_edge857, %for.body.i.sw.bb1147.i_crit_edge856, %for.body.i.sw.bb1147.i_crit_edge855, %for.body.i.sw.bb1147.i_crit_edge854, %for.body.i.sw.bb1147.i_crit_edge853, %for.body.i.sw.bb1147.i_crit_edge852, %for.body.i.sw.bb1147.i_crit_edge851, %for.body.i.sw.bb1147.i_crit_edge850, %for.body.i.sw.bb1147.i_crit_edge849, %for.body.i.sw.bb1147.i_crit_edge848, %for.body.i.sw.bb1147.i_crit_edge
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %69)
  %cmp1148.i = icmp eq i32 %69, 0
  %773 = and i8 %72, 7
  call void @__sanitizer_cov_trace_const_cmp1(i8 5, i8 %773)
  %cmp1154.i = icmp eq i8 %773, 5
  br i1 %cmp1148.i, label %if.then1150.i, label %if.end1185.i

if.then1150.i:                                    ; preds = %sw.bb1147.i
  br i1 %cmp1154.i, label %do.body1157.i, label %if.else1164.i

do.body1157.i:                                    ; preds = %if.then1150.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %774 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %774)
  %775 = load i8*, i8** %prog.i, align 8
  %shl.i.i1923.i = shl nuw nsw i32 1, %conv5.i
  %776 = and i32 %shl.i.i1923.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %776)
  %tobool.i.i1924.i = icmp ne i32 %776, 0
  %777 = zext i1 %tobool.i.i1924.i to i8
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %776)
  %tobool.i11.i1927.i = icmp eq i32 %776, 0
  %byte.addr.1.i1928.v.i = select i1 %tobool.i11.i1927.i, i8 72, i8 76
  %byte.addr.1.i1928.i = or i8 %byte.addr.1.i1928.v.i, %777
  %778 = ptrtoint i8* %775 to i64
  call void @__asan_store1_noabort(i64 %778)
  store i8 %byte.addr.1.i1928.i, i8* %775, align 1
  %add.ptr.i1922.i = getelementptr i8, i8* %775, i64 1
  %779 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %779)
  store i8* %add.ptr.i1922.i, i8** %prog.i, align 8
  br label %do.body1176.i

if.else1164.i:                                    ; preds = %if.then1150.i
  %shl.i1920.i = shl nuw nsw i32 1, %conv5.i
  %780 = and i32 %shl.i1920.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %780)
  %tobool.i1921.i = icmp eq i32 %780, 0
  br i1 %tobool.i1921.i, label %if.else1164.i.do.body1176.i_crit_edge, label %do.body1167.i

if.else1164.i.do.body1176.i_crit_edge:            ; preds = %if.else1164.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body1176.i

do.body1167.i:                                    ; preds = %if.else1164.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %781 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %781)
  %782 = load i8*, i8** %prog.i, align 8
  %783 = ptrtoint i8* %782 to i64
  call void @__asan_store1_noabort(i64 %783)
  store i8 69, i8* %782, align 1
  %add.ptr.i1913.i = getelementptr i8, i8* %782, i64 1
  store i8* %add.ptr.i1913.i, i8** %prog.i, align 8
  br label %do.body1176.i

do.body1176.i:                                    ; preds = %if.else1164.i.do.body1176.i_crit_edge, %do.body1167.i, %do.body1157.i
  %784 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %784)
  %785 = load i8*, i8** %prog.i, align 8
  %idxprom.i1905.i = zext i8 %bf.clear.i to i64
  %arrayidx.i1906.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom.i1905.i
  %786 = ptrtoint i32* %arrayidx.i1906.i to i64
  call void @__asan_load4_noabort(i64 %786)
  %787 = load i32, i32* %arrayidx.i1906.i, align 4
  %add.i1907.i = add i32 %787, 192
  %shl.i1910.i = shl i32 %787, 3
  %add3.i1911.i = add i32 %add.i1907.i, %shl.i1910.i
  %add3.i1911.tr.i = trunc i32 %add3.i1911.i to i16
  %788 = shl i16 %add3.i1911.tr.i, 8
  %conv4.i1903.i = or i16 %788, 133
  %789 = bitcast i8* %785 to i16*
  %790 = ptrtoint i16* %789 to i64
  call void @__asan_store2_noabort(i64 %790)
  store i16 %conv4.i1903.i, i16* %789, align 2
  %add.ptr.i1904.i = getelementptr i8, i8* %785, i64 2
  store i8* %add.ptr.i1904.i, i8** %prog.i, align 8
  br label %emit_cond_jmp.i

if.end1185.i:                                     ; preds = %sw.bb1147.i
  br i1 %cmp1154.i, label %do.body1192.i, label %if.else1199.i

do.body1192.i:                                    ; preds = %if.end1185.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %791 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %791)
  %792 = load i8*, i8** %prog.i, align 8
  %shl.i.i1900.i = shl nuw nsw i32 1, %conv5.i
  %793 = and i32 %shl.i.i1900.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %793)
  %tobool.i.i1901.i = icmp ne i32 %793, 0
  %794 = zext i1 %tobool.i.i1901.i to i8
  %spec.select.i1902.i = or i8 %794, 72
  %795 = ptrtoint i8* %792 to i64
  call void @__asan_store1_noabort(i64 %795)
  store i8 %spec.select.i1902.i, i8* %792, align 1
  %add.ptr.i1899.i = getelementptr i8, i8* %792, i64 1
  %796 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %796)
  store i8* %add.ptr.i1899.i, i8** %prog.i, align 8
  br label %if.end1210.i

if.else1199.i:                                    ; preds = %if.end1185.i
  %shl.i1897.i = shl nuw nsw i32 1, %conv5.i
  %797 = and i32 %shl.i1897.i, 27552
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %797)
  %tobool.i1898.i = icmp eq i32 %797, 0
  br i1 %tobool.i1898.i, label %if.else1199.i.if.end1210.i_crit_edge, label %do.body1202.i

if.else1199.i.if.end1210.i_crit_edge:             ; preds = %if.else1199.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end1210.i

do.body1202.i:                                    ; preds = %if.else1199.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %798 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %798)
  %799 = load i8*, i8** %prog.i, align 8
  %800 = ptrtoint i8* %799 to i64
  call void @__asan_store1_noabort(i64 %800)
  store i8 65, i8* %799, align 1
  %add.ptr.i1893.i = getelementptr i8, i8* %799, i64 1
  store i8* %add.ptr.i1893.i, i8** %prog.i, align 8
  br label %if.end1210.i

if.end1210.i:                                     ; preds = %if.else1199.i.if.end1210.i_crit_edge, %do.body1202.i, %do.body1192.i
  %value.off.i1892.i = add i32 %69, 128
  call void @__sanitizer_cov_trace_const_cmp4(i32 256, i32 %value.off.i1892.i)
  %801 = icmp ult i32 %value.off.i1892.i, 256
  %802 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %802)
  %803 = load i8*, i8** %prog.i, align 8
  %idxprom.i1890.i = zext i8 %bf.clear.i to i64
  %arrayidx.i1891.i = getelementptr [15 x i32], [15 x i32]* @reg2hex, i64 0, i64 %idxprom.i1890.i
  %804 = ptrtoint i32* %arrayidx.i1891.i to i64
  call void @__asan_load4_noabort(i64 %804)
  %805 = load i32, i32* %arrayidx.i1891.i, align 4
  %conv1.i.i = shl i32 %805, 8
  %conv1215.i = add i32 %conv1.i.i, 63488
  br i1 %801, label %do.body1213.i, label %do.body1226.i

do.body1213.i:                                    ; preds = %if.end1210.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %shl1216.i = and i32 %conv1215.i, 65280
  %shl1218.i = shl nsw i32 %69, 16
  %add1217.i = or i32 %shl1218.i, %shl1216.i
  %add1219.i = or i32 %add1217.i, 131
  %806 = bitcast i8* %803 to i32*
  %807 = ptrtoint i32* %806 to i64
  call void @__asan_store4_noabort(i64 %807)
  store i32 %add1219.i, i32* %806, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i1886.i = getelementptr i8, i8* %803, i64 3
  %808 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %808)
  store i8* %add.ptr.i1886.i, i8** %prog.i, align 8
  br label %emit_cond_jmp.i

do.body1226.i:                                    ; preds = %if.end1210.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %809 = trunc i32 %conv1215.i to i16
  %conv4.i1884.i = or i16 %809, 129
  %810 = bitcast i8* %803 to i16*
  %811 = ptrtoint i16* %810 to i64
  call void @__asan_store2_noabort(i64 %811)
  store i16 %conv4.i1884.i, i16* %810, align 2
  %add.ptr.i1885.i = getelementptr i8, i8* %803, i64 2
  %812 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %812)
  store i8* %add.ptr.i1885.i, i8** %prog.i, align 8
  %813 = bitcast i8* %add.ptr.i1885.i to i32*
  %814 = ptrtoint i32* %813 to i64
  call void @__asan_store4_noabort(i64 %814)
  store i32 %69, i32* %813, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i1882.i = getelementptr i8, i8* %803, i64 6
  %815 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %815)
  store i8* %add.ptr.i1882.i, i8** %prog.i, align 8
  br label %emit_cond_jmp.i

emit_cond_jmp.i:                                  ; preds = %do.body1226.i, %do.body1213.i, %do.body1176.i, %do.body1131.i, %do.body1095.i, %do.body1056.i
  %816 = ptrtoint i8* %code.i to i64
  call void @__asan_load1_noabort(i64 %816)
  %817 = load i8, i8* %code.i, align 4
  %818 = and i8 %817, -16
  %and1245.i = zext i8 %818 to i32
  %819 = add nsw i32 %and1245.i, -16
  %820 = lshr exact i32 %819, 4
  call void @__sanitizer_cov_trace_const_cmp4(i32 208, i32 %819)
  %821 = icmp ult i32 %819, 208
  br i1 %821, label %switch.hole_check, label %emit_cond_jmp.i.do_jit.exit.thread_crit_edge

emit_cond_jmp.i.do_jit.exit.thread_crit_edge:     ; preds = %emit_cond_jmp.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do_jit.exit.thread

switch.hole_check:                                ; preds = %emit_cond_jmp.i
  %switch.maskindex = trunc i32 %820 to i16
  %switch.shifted = lshr i16 7807, %switch.maskindex
  %822 = and i16 %switch.shifted, 1
  call void @__sanitizer_cov_trace_const_cmp2(i16 0, i16 %822)
  %switch.lobit = icmp eq i16 %822, 0
  br i1 %switch.lobit, label %switch.hole_check.do_jit.exit.thread_crit_edge, label %switch.lookup633

switch.hole_check.do_jit.exit.thread_crit_edge:   ; preds = %switch.hole_check
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do_jit.exit.thread

switch.lookup633:                                 ; preds = %switch.hole_check
  %823 = zext i32 %820 to i64
  %switch.gep634 = getelementptr inbounds [13 x i8], [13 x i8]* @switch.table.bpf_int_jit_compile.22, i64 0, i64 %823
  %824 = ptrtoint i8* %switch.gep634 to i64
  call void @__asan_load1_noabort(i64 %824)
  %switch.load635 = load i8, i8* %switch.gep634, align 1
  %off1257.i = getelementptr inbounds %struct.bpf_insn, %struct.bpf_insn* %insn.02525.i, i64 0, i32 2
  %825 = ptrtoint i16* %off1257.i to i64
  call void @__asan_load2_noabort(i64 %825)
  %826 = load i16, i16* %off1257.i, align 2
  %conv1258.i = sext i16 %826 to i32
  %add1259.i = add i32 %i.02531.i, %conv1258.i
  %idxprom1260.i = sext i32 %add1259.i to i64
  %arrayidx1261.i = getelementptr i32, i32* %addrs.0, i64 %idxprom1260.i
  %827 = ptrtoint i32* %arrayidx1261.i to i64
  call void @__asan_load4_noabort(i64 %827)
  %828 = load i32, i32* %arrayidx1261.i, align 4
  %idxprom1262.i = sext i32 %i.02531.i to i64
  %arrayidx1263.i = getelementptr i32, i32* %addrs.0, i64 %idxprom1262.i
  %829 = ptrtoint i32* %arrayidx1263.i to i64
  call void @__asan_load4_noabort(i64 %829)
  %830 = load i32, i32* %arrayidx1263.i, align 4
  %sub1264.i = sub i32 %828, %830
  %value.off.i1881.i = add i32 %sub1264.i, 128
  call void @__sanitizer_cov_trace_const_cmp4(i32 256, i32 %value.off.i1881.i)
  %831 = icmp ult i32 %value.off.i1881.i, 256
  %832 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %832)
  %833 = load i8*, i8** %prog.i, align 8
  br i1 %831, label %do.body1269.i, label %do.body1282.i

do.body1269.i:                                    ; preds = %switch.lookup633
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %conv1270.i = zext i8 %switch.load635 to i32
  %shl1271.i = shl nsw i32 %sub1264.i, 8
  %add1272.i = or i32 %shl1271.i, %conv1270.i
  %conv4.i1879.i = trunc i32 %add1272.i to i16
  %834 = bitcast i8* %833 to i16*
  %835 = ptrtoint i16* %834 to i64
  call void @__asan_store2_noabort(i64 %835)
  store i16 %conv4.i1879.i, i16* %834, align 2
  %add.ptr.i1880.i = getelementptr i8, i8* %833, i64 2
  %836 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %836)
  store i8* %add.ptr.i1880.i, i8** %prog.i, align 8
  br label %sw.epilog1406.i

do.body1282.i:                                    ; preds = %switch.lookup633
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %narrow.i = add nuw i8 %switch.load635, 16
  %add1284.i = zext i8 %narrow.i to i16
  %shl1285.i = shl nuw i16 %add1284.i, 8
  %add1286.i = or i16 %shl1285.i, 15
  %837 = bitcast i8* %833 to i16*
  %838 = ptrtoint i16* %837 to i64
  call void @__asan_store2_noabort(i64 %838)
  store i16 %add1286.i, i16* %837, align 2
  %add.ptr.i1878.i = getelementptr i8, i8* %833, i64 2
  %839 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %839)
  store i8* %add.ptr.i1878.i, i8** %prog.i, align 8
  %840 = bitcast i8* %add.ptr.i1878.i to i32*
  %841 = ptrtoint i32* %840 to i64
  call void @__asan_store4_noabort(i64 %841)
  store i32 %sub1264.i, i32* %840, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i1870.i = getelementptr i8, i8* %833, i64 6
  %842 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %842)
  store i8* %add.ptr.i1870.i, i8** %prog.i, align 8
  br label %sw.epilog1406.i

sw.bb1303.i:                                      ; preds = %for.body.i
  %off1304.i = getelementptr inbounds %struct.bpf_insn, %struct.bpf_insn* %insn.02525.i, i64 0, i32 2
  %843 = ptrtoint i16* %off1304.i to i64
  call void @__asan_load2_noabort(i64 %843)
  %844 = load i16, i16* %off1304.i, align 2
  call void @__sanitizer_cov_trace_const_cmp2(i16 -1, i16 %844)
  %cmp1306.i = icmp eq i16 %844, -1
  br i1 %cmp1306.i, label %sw.bb1303.i.do.body1326.i_crit_edge, label %if.end1319.i

sw.bb1303.i.do.body1326.i_crit_edge:              ; preds = %sw.bb1303.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body1326.i

if.end1319.i:                                     ; preds = %sw.bb1303.i
  %conv1305.i = sext i16 %844 to i32
  %add1312.i = add i32 %i.02531.i, %conv1305.i
  %idxprom1313.i = sext i32 %add1312.i to i64
  %arrayidx1314.i = getelementptr i32, i32* %addrs.0, i64 %idxprom1313.i
  %845 = ptrtoint i32* %arrayidx1314.i to i64
  call void @__asan_load4_noabort(i64 %845)
  %846 = load i32, i32* %arrayidx1314.i, align 4
  %idxprom1315.i = sext i32 %i.02531.i to i64
  %arrayidx1316.i = getelementptr i32, i32* %addrs.0, i64 %idxprom1315.i
  %847 = ptrtoint i32* %arrayidx1316.i to i64
  call void @__asan_load4_noabort(i64 %847)
  %848 = load i32, i32* %arrayidx1316.i, align 4
  %sub1317.i = sub i32 %846, %848
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %sub1317.i)
  %tobool1320.i = icmp eq i32 %sub1317.i, 0
  br i1 %tobool1320.i, label %if.end1319.i.sw.epilog1406.i_crit_edge, label %if.end1319.i.emit_jmp.i_crit_edge

if.end1319.i.emit_jmp.i_crit_edge:                ; preds = %if.end1319.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit_jmp.i

if.end1319.i.sw.epilog1406.i_crit_edge:           ; preds = %if.end1319.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.epilog1406.i

emit_jmp.i:                                       ; preds = %if.end1319.i.emit_jmp.i_crit_edge, %if.then1357.i
  %jmp_offset.1.i = phi i32 [ %sub1360.i, %if.then1357.i ], [ %sub1317.i, %if.end1319.i.emit_jmp.i_crit_edge ]
  %value.off.i.i = add i32 %jmp_offset.1.i, 128
  call void @__sanitizer_cov_trace_const_cmp4(i32 256, i32 %value.off.i.i)
  %849 = icmp ult i32 %value.off.i.i, 256
  br i1 %849, label %emit_jmp.i.do.body1326.i_crit_edge, label %do.body1338.i

emit_jmp.i.do.body1326.i_crit_edge:               ; preds = %emit_jmp.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body1326.i

do.body1326.i:                                    ; preds = %emit_jmp.i.do.body1326.i_crit_edge, %sw.bb1303.i.do.body1326.i_crit_edge
  %conv13232473.i = phi i32 [ %jmp_offset.1.i, %emit_jmp.i.do.body1326.i_crit_edge ], [ -2, %sw.bb1303.i.do.body1326.i_crit_edge ]
  %850 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %850)
  %851 = load i8*, i8** %prog.i, align 8
  %conv13232473.tr.i = trunc i32 %conv13232473.i to i16
  %852 = shl nsw i16 %conv13232473.tr.i, 8
  %conv4.i.i = or i16 %852, 235
  %853 = bitcast i8* %851 to i16*
  %854 = ptrtoint i16* %853 to i64
  call void @__asan_store2_noabort(i64 %854)
  store i16 %conv4.i.i, i16* %853, align 2
  %add.ptr.i1869.i = getelementptr i8, i8* %851, i64 2
  store i8* %add.ptr.i1869.i, i8** %prog.i, align 8
  br label %sw.epilog1406.i

do.body1338.i:                                    ; preds = %emit_jmp.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %855 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %855)
  %856 = load i8*, i8** %prog.i, align 8
  %857 = ptrtoint i8* %856 to i64
  call void @__asan_store1_noabort(i64 %857)
  store i8 -23, i8* %856, align 1
  %add.ptr.i1868.i = getelementptr i8, i8* %856, i64 1
  store i8* %add.ptr.i1868.i, i8** %prog.i, align 8
  %858 = bitcast i8* %add.ptr.i1868.i to i32*
  %859 = ptrtoint i32* %858 to i64
  call void @__asan_store4_noabort(i64 %859)
  store i32 %jmp_offset.1.i, i32* %858, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i1863.i = getelementptr i8, i8* %856, i64 5
  %860 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %860)
  store i8* %add.ptr.i1863.i, i8** %prog.i, align 8
  br label %sw.epilog1406.i

sw.bb1355.i:                                      ; preds = %for.body.i
  %861 = and i8 %seen_exit.02528.i, 1
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %861)
  %tobool1356.i = icmp eq i8 %861, 0
  br i1 %tobool1356.i, label %if.end1362.i, label %if.then1357.i

if.then1357.i:                                    ; preds = %sw.bb1355.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %idxprom1358.i = sext i32 %i.02531.i to i64
  %arrayidx1359.i = getelementptr i32, i32* %addrs.0, i64 %idxprom1358.i
  %862 = ptrtoint i32* %arrayidx1359.i to i64
  call void @__asan_load4_noabort(i64 %862)
  %863 = load i32, i32* %arrayidx1359.i, align 4
  %sub1360.i = sub i32 %ctx.sroa.0.2, %863
  br label %emit_jmp.i

if.end1362.i:                                     ; preds = %sw.bb1355.i
  %864 = ptrtoint i32* %type.i.i to i64
  call void @__asan_load4_noabort(i64 %864)
  %865 = load i32, i32* %type.i.i, align 4
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %865)
  %cmp.i1862.i = icmp eq i32 %865, 0
  br i1 %cmp.i1862.i, label %if.end1362.i.do.body1372.i_crit_edge, label %do.body1366.i

if.end1362.i.do.body1372.i_crit_edge:             ; preds = %if.end1362.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body1372.i

do.body1366.i:                                    ; preds = %if.end1362.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %866 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %866)
  %867 = load i8*, i8** %prog.i, align 8
  %868 = ptrtoint i8* %867 to i64
  call void @__asan_store1_noabort(i64 %868)
  store i8 91, i8* %867, align 1
  %add.ptr.i1860.i = getelementptr i8, i8* %867, i64 1
  store i8* %add.ptr.i1860.i, i8** %prog.i, align 8
  br label %do.body1372.i

do.body1372.i:                                    ; preds = %if.end1362.i.do.body1372.i_crit_edge, %do.body1366.i
  %869 = ptrtoint i8** %prog.i to i64
  call void @__asan_load8_noabort(i64 %869)
  %870 = load i8*, i8** %prog.i, align 8
  %871 = bitcast i8* %870 to i16*
  %872 = ptrtoint i16* %871 to i64
  call void @__asan_store2_noabort(i64 %872)
  store i16 24385, i16* %871, align 2
  %add.ptr.i1859.i = getelementptr i8, i8* %870, i64 2
  %873 = bitcast i8* %add.ptr.i1859.i to i16*
  %874 = ptrtoint i16* %873 to i64
  call void @__asan_store2_noabort(i64 %874)
  store i16 24129, i16* %873, align 2
  %add.ptr.i1858.i = getelementptr i8, i8* %870, i64 4
  %875 = bitcast i8* %add.ptr.i1858.i to i16*
  %876 = ptrtoint i16* %875 to i64
  call void @__asan_store2_noabort(i64 %876)
  store i16 23873, i16* %875, align 2
  %add.ptr.i1857.i = getelementptr i8, i8* %870, i64 6
  %877 = ptrtoint i8* %add.ptr.i1857.i to i64
  call void @__asan_store1_noabort(i64 %877)
  store i8 91, i8* %add.ptr.i1857.i, align 1
  %add.ptr.i1856.i = getelementptr i8, i8* %870, i64 7
  %878 = ptrtoint i8* %add.ptr.i1856.i to i64
  call void @__asan_store1_noabort(i64 %878)
  store i8 -55, i8* %add.ptr.i1856.i, align 1
  %add.ptr.i1855.i = getelementptr i8, i8* %870, i64 8
  %879 = ptrtoint i8* %add.ptr.i1855.i to i64
  call void @__asan_store1_noabort(i64 %879)
  store i8 -61, i8* %add.ptr.i1855.i, align 1
  %add.ptr.i.i = getelementptr i8, i8* %870, i64 9
  store i8* %add.ptr.i.i, i8** %prog.i, align 8
  br label %sw.epilog1406.i

sw.default1402.i:                                 ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %conv9.i = zext i8 %72 to i32
  %call1405.i = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.11, i64 0, i64 0), i32 %conv9.i) #16
  br label %do_jit.exit.thread

sw.epilog1406.i:                                  ; preds = %if.end1319.i.sw.epilog1406.i_crit_edge, %if.then883.i.sw.epilog1406.i_crit_edge, %sw.bb872.i.sw.epilog1406.i_crit_edge, %sw.bb724.i.sw.epilog1406.i_crit_edge, %sw.bb642.i.sw.epilog1406.i_crit_edge, %if.end602.i.sw.epilog1406.i_crit_edge, %if.end414.i.sw.epilog1406.i_crit_edge, %do.body295.i.sw.epilog1406.i_crit_edge, %do.body1372.i, %do.body1338.i, %do.body1326.i, %do.body1282.i, %do.body1269.i, %if.else1024.i, %if.then1017.i, %emit_call.exit.thread.i, %do.body985.i, %do.body972.i, %if.end920.i, %sw.bb866.i, %emit_code.exit.i, %do.body756.i, %do.body740.i, %do.body711.i, %do.body703.i, %do.body681.i, %do.body618.i, %do.body489.i, %do.body479.i, %do.body422.i, %do.body309.i, %emit_mov_imm64.exit.i, %emit_mov_imm32.exit.i, %do.body155.i, %do.body140.i, %do.body125.i, %do.body79.i, %emit_mov_reg.exit.i, %do.body38.i
  %ctx.sroa.0.3 = phi i32 [ %proglen.02544.i, %do.body1372.i ], [ %ctx.sroa.0.2, %do.body1326.i ], [ %ctx.sroa.0.2, %do.body1338.i ], [ %ctx.sroa.0.2, %if.end1319.i.sw.epilog1406.i_crit_edge ], [ %ctx.sroa.0.2, %do.body1269.i ], [ %ctx.sroa.0.2, %do.body1282.i ], [ %ctx.sroa.0.2, %if.else1024.i ], [ %ctx.sroa.0.2, %if.then1017.i ], [ %ctx.sroa.0.2, %emit_call.exit.thread.i ], [ %ctx.sroa.0.2, %do.body972.i ], [ %ctx.sroa.0.2, %do.body985.i ], [ %ctx.sroa.0.2, %if.then883.i.sw.epilog1406.i_crit_edge ], [ %ctx.sroa.0.2, %if.end920.i ], [ %ctx.sroa.0.2, %sw.bb872.i.sw.epilog1406.i_crit_edge ], [ %ctx.sroa.0.2, %sw.bb866.i ], [ %ctx.sroa.0.2, %emit_code.exit.i ], [ %ctx.sroa.0.2, %sw.bb724.i.sw.epilog1406.i_crit_edge ], [ %ctx.sroa.0.2, %do.body756.i ], [ %ctx.sroa.0.2, %do.body740.i ], [ %ctx.sroa.0.2, %sw.bb642.i.sw.epilog1406.i_crit_edge ], [ %ctx.sroa.0.2, %do.body711.i ], [ %ctx.sroa.0.2, %do.body703.i ], [ %ctx.sroa.0.2, %do.body681.i ], [ %ctx.sroa.0.2, %do.body618.i ], [ %ctx.sroa.0.2, %if.end602.i.sw.epilog1406.i_crit_edge ], [ %ctx.sroa.0.2, %do.body479.i ], [ %ctx.sroa.0.2, %do.body489.i ], [ %ctx.sroa.0.2, %do.body422.i ], [ %ctx.sroa.0.2, %if.end414.i.sw.epilog1406.i_crit_edge ], [ %ctx.sroa.0.2, %do.body295.i.sw.epilog1406.i_crit_edge ], [ %ctx.sroa.0.2, %do.body309.i ], [ %ctx.sroa.0.2, %emit_mov_imm64.exit.i ], [ %ctx.sroa.0.2, %emit_mov_imm32.exit.i ], [ %ctx.sroa.0.2, %do.body125.i ], [ %ctx.sroa.0.2, %do.body140.i ], [ %ctx.sroa.0.2, %do.body155.i ], [ %ctx.sroa.0.2, %do.body79.i ], [ %ctx.sroa.0.2, %emit_mov_reg.exit.i ], [ %ctx.sroa.0.2, %do.body38.i ]
  %insn.1.i = phi %struct.bpf_insn* [ %insn.02525.i, %do.body1372.i ], [ %insn.02525.i, %do.body1326.i ], [ %insn.02525.i, %do.body1338.i ], [ %insn.02525.i, %if.end1319.i.sw.epilog1406.i_crit_edge ], [ %insn.02525.i, %do.body1269.i ], [ %insn.02525.i, %do.body1282.i ], [ %insn.02525.i, %if.else1024.i ], [ %insn.02525.i, %if.then1017.i ], [ %insn.02525.i, %emit_call.exit.thread.i ], [ %insn.02525.i, %do.body972.i ], [ %insn.02525.i, %do.body985.i ], [ %insn.02525.i, %if.then883.i.sw.epilog1406.i_crit_edge ], [ %insn.02525.i, %if.end920.i ], [ %insn.02525.i, %sw.bb872.i.sw.epilog1406.i_crit_edge ], [ %insn.02525.i, %sw.bb866.i ], [ %insn.02525.i, %emit_code.exit.i ], [ %insn.02525.i, %sw.bb724.i.sw.epilog1406.i_crit_edge ], [ %insn.02525.i, %do.body756.i ], [ %insn.02525.i, %do.body740.i ], [ %insn.02525.i, %sw.bb642.i.sw.epilog1406.i_crit_edge ], [ %insn.02525.i, %do.body711.i ], [ %insn.02525.i, %do.body703.i ], [ %insn.02525.i, %do.body681.i ], [ %insn.02525.i, %do.body618.i ], [ %insn.02525.i, %if.end602.i.sw.epilog1406.i_crit_edge ], [ %insn.02525.i, %do.body479.i ], [ %insn.02525.i, %do.body489.i ], [ %insn.02525.i, %do.body422.i ], [ %insn.02525.i, %if.end414.i.sw.epilog1406.i_crit_edge ], [ %insn.02525.i, %do.body295.i.sw.epilog1406.i_crit_edge ], [ %insn.02525.i, %do.body309.i ], [ %incdec.ptr.i, %emit_mov_imm64.exit.i ], [ %insn.02525.i, %emit_mov_imm32.exit.i ], [ %insn.02525.i, %do.body125.i ], [ %insn.02525.i, %do.body140.i ], [ %insn.02525.i, %do.body155.i ], [ %insn.02525.i, %do.body79.i ], [ %insn.02525.i, %emit_mov_reg.exit.i ], [ %insn.02525.i, %do.body38.i ]
  %seen_exit.1.i = phi i8 [ 1, %do.body1372.i ], [ %seen_exit.02528.i, %do.body1326.i ], [ %seen_exit.02528.i, %do.body1338.i ], [ %seen_exit.02528.i, %if.end1319.i.sw.epilog1406.i_crit_edge ], [ %seen_exit.02528.i, %do.body1269.i ], [ %seen_exit.02528.i, %do.body1282.i ], [ %seen_exit.02528.i, %if.else1024.i ], [ %seen_exit.02528.i, %if.then1017.i ], [ %seen_exit.02528.i, %emit_call.exit.thread.i ], [ %seen_exit.02528.i, %do.body972.i ], [ %seen_exit.02528.i, %do.body985.i ], [ %seen_exit.02528.i, %if.then883.i.sw.epilog1406.i_crit_edge ], [ %seen_exit.02528.i, %if.end920.i ], [ %seen_exit.02528.i, %sw.bb872.i.sw.epilog1406.i_crit_edge ], [ %seen_exit.02528.i, %sw.bb866.i ], [ %seen_exit.02528.i, %emit_code.exit.i ], [ %seen_exit.02528.i, %sw.bb724.i.sw.epilog1406.i_crit_edge ], [ %seen_exit.02528.i, %do.body756.i ], [ %seen_exit.02528.i, %do.body740.i ], [ %seen_exit.02528.i, %sw.bb642.i.sw.epilog1406.i_crit_edge ], [ %seen_exit.02528.i, %do.body711.i ], [ %seen_exit.02528.i, %do.body703.i ], [ %seen_exit.02528.i, %do.body681.i ], [ %seen_exit.02528.i, %do.body618.i ], [ %seen_exit.02528.i, %if.end602.i.sw.epilog1406.i_crit_edge ], [ %seen_exit.02528.i, %do.body479.i ], [ %seen_exit.02528.i, %do.body489.i ], [ %seen_exit.02528.i, %do.body422.i ], [ %seen_exit.02528.i, %if.end414.i.sw.epilog1406.i_crit_edge ], [ %seen_exit.02528.i, %do.body295.i.sw.epilog1406.i_crit_edge ], [ %seen_exit.02528.i, %do.body309.i ], [ %seen_exit.02528.i, %emit_mov_imm64.exit.i ], [ %seen_exit.02528.i, %emit_mov_imm32.exit.i ], [ %seen_exit.02528.i, %do.body125.i ], [ %seen_exit.02528.i, %do.body140.i ], [ %seen_exit.02528.i, %do.body155.i ], [ %seen_exit.02528.i, %do.body79.i ], [ %seen_exit.02528.i, %emit_mov_reg.exit.i ], [ %seen_exit.02528.i, %do.body38.i ]
  %i.1.i = phi i32 [ %i.02531.i, %do.body1372.i ], [ %i.02531.i, %do.body1326.i ], [ %i.02531.i, %do.body1338.i ], [ %i.02531.i, %if.end1319.i.sw.epilog1406.i_crit_edge ], [ %i.02531.i, %do.body1269.i ], [ %i.02531.i, %do.body1282.i ], [ %i.02531.i, %if.else1024.i ], [ %i.02531.i, %if.then1017.i ], [ %i.02531.i, %emit_call.exit.thread.i ], [ %i.02531.i, %do.body972.i ], [ %i.02531.i, %do.body985.i ], [ %i.02531.i, %if.then883.i.sw.epilog1406.i_crit_edge ], [ %i.02531.i, %if.end920.i ], [ %i.02531.i, %sw.bb872.i.sw.epilog1406.i_crit_edge ], [ %i.02531.i, %sw.bb866.i ], [ %i.02531.i, %emit_code.exit.i ], [ %i.02531.i, %sw.bb724.i.sw.epilog1406.i_crit_edge ], [ %i.02531.i, %do.body756.i ], [ %i.02531.i, %do.body740.i ], [ %i.02531.i, %sw.bb642.i.sw.epilog1406.i_crit_edge ], [ %i.02531.i, %do.body711.i ], [ %i.02531.i, %do.body703.i ], [ %i.02531.i, %do.body681.i ], [ %i.02531.i, %do.body618.i ], [ %i.02531.i, %if.end602.i.sw.epilog1406.i_crit_edge ], [ %i.02531.i, %do.body479.i ], [ %i.02531.i, %do.body489.i ], [ %i.02531.i, %do.body422.i ], [ %i.02531.i, %if.end414.i.sw.epilog1406.i_crit_edge ], [ %i.02531.i, %do.body295.i.sw.epilog1406.i_crit_edge ], [ %i.02531.i, %do.body309.i ], [ %inc.i, %emit_mov_imm64.exit.i ], [ %i.02531.i, %emit_mov_imm32.exit.i ], [ %i.02531.i, %do.body125.i ], [ %i.02531.i, %do.body140.i ], [ %i.02531.i, %do.body155.i ], [ %i.02531.i, %do.body79.i ], [ %i.02531.i, %emit_mov_reg.exit.i ], [ %i.02531.i, %do.body38.i ]
  %excnt.2.i = phi i32 [ %excnt.02541.i, %do.body1372.i ], [ %excnt.02541.i, %do.body1326.i ], [ %excnt.02541.i, %do.body1338.i ], [ %excnt.02541.i, %if.end1319.i.sw.epilog1406.i_crit_edge ], [ %excnt.02541.i, %do.body1269.i ], [ %excnt.02541.i, %do.body1282.i ], [ %excnt.02541.i, %if.else1024.i ], [ %excnt.02541.i, %if.then1017.i ], [ %excnt.02541.i, %emit_call.exit.thread.i ], [ %excnt.02541.i, %do.body972.i ], [ %excnt.02541.i, %do.body985.i ], [ %excnt.02541.i, %if.then883.i.sw.epilog1406.i_crit_edge ], [ %inc896.i, %if.end920.i ], [ %excnt.02541.i, %sw.bb872.i.sw.epilog1406.i_crit_edge ], [ %excnt.02541.i, %sw.bb866.i ], [ %excnt.02541.i, %emit_code.exit.i ], [ %excnt.02541.i, %sw.bb724.i.sw.epilog1406.i_crit_edge ], [ %excnt.02541.i, %do.body756.i ], [ %excnt.02541.i, %do.body740.i ], [ %excnt.02541.i, %sw.bb642.i.sw.epilog1406.i_crit_edge ], [ %excnt.02541.i, %do.body711.i ], [ %excnt.02541.i, %do.body703.i ], [ %excnt.02541.i, %do.body681.i ], [ %excnt.02541.i, %do.body618.i ], [ %excnt.02541.i, %if.end602.i.sw.epilog1406.i_crit_edge ], [ %excnt.02541.i, %do.body479.i ], [ %excnt.02541.i, %do.body489.i ], [ %excnt.02541.i, %do.body422.i ], [ %excnt.02541.i, %if.end414.i.sw.epilog1406.i_crit_edge ], [ %excnt.02541.i, %do.body295.i.sw.epilog1406.i_crit_edge ], [ %excnt.02541.i, %do.body309.i ], [ %excnt.02541.i, %emit_mov_imm64.exit.i ], [ %excnt.02541.i, %emit_mov_imm32.exit.i ], [ %excnt.02541.i, %do.body125.i ], [ %excnt.02541.i, %do.body140.i ], [ %excnt.02541.i, %do.body155.i ], [ %excnt.02541.i, %do.body79.i ], [ %excnt.02541.i, %emit_mov_reg.exit.i ], [ %excnt.02541.i, %do.body38.i ]
  %880 = ptrtoint i64* %43 to i64
  call void @__asan_load8_noabort(i64 %880)
  %881 = load i64, i64* %43, align 8
  %sub.ptr.sub1410.i = sub i64 %881, %sub.ptr.rhs.cast.i
  %conv1411.i = trunc i64 %sub.ptr.sub1410.i to i32
  call void @__sanitizer_cov_trace_const_cmp4(i32 128, i32 %conv1411.i)
  %cmp1412.i = icmp sgt i32 %conv1411.i, 128
  br i1 %cmp1412.i, label %if.then1414.i, label %if.end1416.i

if.then1414.i:                                    ; preds = %sw.epilog1406.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %call1415.i = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.12, i64 0, i64 0)) #16
  br label %do_jit.exit.thread

if.end1416.i:                                     ; preds = %sw.epilog1406.i
  %.pre.i = add i32 %proglen.02544.i, %conv1411.i
  br i1 %tobool1417.i, label %if.end1416.i.for.inc.i_crit_edge, label %if.then1418.i

if.end1416.i.for.inc.i_crit_edge:                 ; preds = %if.end1416.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.inc.i

if.then1418.i:                                    ; preds = %if.end1416.i
  call void @__sanitizer_cov_trace_cmp4(i32 %.pre.i, i32 %oldproglen.1406)
  %cmp1420.i = icmp sgt i32 %.pre.i, %oldproglen.1406
  br i1 %cmp1420.i, label %if.then1425.i, label %if.end1427.i, !prof !44, !misexpect !45

if.then1425.i:                                    ; preds = %if.then1418.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %call1426.i = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.13, i64 0, i64 0)) #16
  br label %do_jit.exit.thread

if.end1427.i:                                     ; preds = %if.then1418.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %idx.ext1428.i = sext i32 %proglen.02544.i to i64
  %add.ptr1429.i = getelementptr i8, i8* %.pr409, i64 %idx.ext1428.i
  %sext.i = shl i64 %sub.ptr.sub1410.i, 32
  %conv1431.i = ashr exact i64 %sext.i, 32
  %call1432.i = call i8* @memcpy(i8* %add.ptr1429.i, i8* nonnull %34, i64 %conv1431.i) #13
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.end1416.i.for.inc.i_crit_edge, %if.end1427.i
  %idxprom1435.i = sext i32 %i.1.i to i64
  %arrayidx1436.i = getelementptr i32, i32* %addrs.0, i64 %idxprom1435.i
  %882 = ptrtoint i32* %arrayidx1436.i to i64
  call void @__asan_store4_noabort(i64 %882)
  store i32 %.pre.i, i32* %arrayidx1436.i, align 4
  %883 = ptrtoint i8** %prog.i to i64
  call void @__asan_store8_noabort(i64 %883)
  store i8* %34, i8** %prog.i, align 8
  %inc1449.i = add i32 %i.1.i, 1
  %incdec.ptr1450.i = getelementptr %struct.bpf_insn, %struct.bpf_insn* %insn.1.i, i64 1
  %cmp.i245 = icmp sgt i32 %inc1449.i, %45
  br i1 %cmp.i245, label %for.inc.i.for.end.i_crit_edge, label %for.inc.i.for.body.i_crit_edge

for.inc.i.for.body.i_crit_edge:                   ; preds = %for.inc.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.body.i

for.inc.i.for.end.i_crit_edge:                    ; preds = %for.inc.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.end.i

for.end.i:                                        ; preds = %for.inc.i.for.end.i_crit_edge, %emit_prologue.exit.i.for.end.i_crit_edge
  %ctx.sroa.0.4 = phi i32 [ %ctx.sroa.0.1405, %emit_prologue.exit.i.for.end.i_crit_edge ], [ %ctx.sroa.0.3, %for.inc.i.for.end.i_crit_edge ]
  %excnt.0.lcssa.i = phi i32 [ 0, %emit_prologue.exit.i.for.end.i_crit_edge ], [ %excnt.2.i, %for.inc.i.for.end.i_crit_edge ]
  %proglen.0.lcssa.i = phi i32 [ 0, %emit_prologue.exit.i.for.end.i_crit_edge ], [ %.pre.i, %for.inc.i.for.end.i_crit_edge ]
  %tobool1451.i = icmp eq i8* %.pr409, null
  br i1 %tobool1451.i, label %for.end.i.do_jit.exit_crit_edge, label %land.lhs.true.i

for.end.i.do_jit.exit_crit_edge:                  ; preds = %for.end.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do_jit.exit

land.lhs.true.i:                                  ; preds = %for.end.i
  %884 = ptrtoint %struct.bpf_prog_aux** %aux to i64
  call void @__asan_load8_noabort(i64 %884)
  %885 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %aux, align 8
  %num_exentries1453.i = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %885, i64 0, i32 44
  %886 = ptrtoint i32* %num_exentries1453.i to i64
  call void @__asan_load4_noabort(i64 %886)
  %887 = load i32, i32* %num_exentries1453.i, align 4
  call void @__sanitizer_cov_trace_cmp4(i32 %excnt.0.lcssa.i, i32 %887)
  %cmp1454.i = icmp eq i32 %excnt.0.lcssa.i, %887
  br i1 %cmp1454.i, label %land.lhs.true.i.do_jit.exit_crit_edge, label %if.then1456.i

land.lhs.true.i.do_jit.exit_crit_edge:            ; preds = %land.lhs.true.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do_jit.exit

if.then1456.i:                                    ; preds = %land.lhs.true.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %call1457.i = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.14, i64 0, i64 0)) #16
  br label %do_jit.exit.thread

do_jit.exit.thread:                               ; preds = %switch.hole_check.do_jit.exit.thread_crit_edge, %emit_cond_jmp.i.do_jit.exit.thread_crit_edge, %sw.bb1002.i.do_jit.exit.thread_crit_edge, %if.then1456.i, %emit_call.exit.i, %if.then1425.i, %if.then1414.i, %sw.default1402.i, %if.then891.i, %if.then918.i, %if.then911.i, %if.then903.i
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %35) #15
  call void @llvm.lifetime.end.p0i8(i64 192, i8* nonnull %34) #15
  br label %out_image

do_jit.exit:                                      ; preds = %land.lhs.true.i.do_jit.exit_crit_edge, %for.end.i.do_jit.exit_crit_edge
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %35) #15
  call void @llvm.lifetime.end.p0i8(i64 192, i8* nonnull %34) #15
  call void @__sanitizer_cov_trace_const_cmp4(i32 1, i32 %proglen.0.lcssa.i)
  %cmp38 = icmp slt i32 %proglen.0.lcssa.i, 1
  br i1 %cmp38, label %do_jit.exit.out_image_crit_edge, label %if.end44

do_jit.exit.out_image_crit_edge:                  ; preds = %do_jit.exit
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %out_image

out_image:                                        ; preds = %do_jit.exit.out_image_crit_edge, %do_jit.exit.thread, %if.then49
  %888 = ptrtoint i8** %image to i64
  call void @__asan_store8_noabort(i64 %888)
  store i8* null, i8** %image, align 8
  %tobool41 = icmp eq %struct.bpf_binary_header* %header.1408, null
  br i1 %tobool41, label %out_image.out_addrs_crit_edge, label %if.then42

out_image.out_addrs_crit_edge:                    ; preds = %out_image
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %out_addrs

if.then42:                                        ; preds = %out_image
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  call void @bpf_jit_binary_free(%struct.bpf_binary_header* nonnull %header.1408) #13
  br label %out_addrs

if.end44:                                         ; preds = %do_jit.exit
  %889 = ptrtoint i8** %image to i64
  call void @__asan_load8_noabort(i64 %889)
  %890 = load i8*, i8** %image, align 8
  %tobool45 = icmp eq i8* %890, null
  call void @__sanitizer_cov_trace_cmp4(i32 %proglen.0.lcssa.i, i32 %oldproglen.1406)
  %cmp53 = icmp eq i32 %proglen.0.lcssa.i, %oldproglen.1406
  br i1 %tobool45, label %if.end52, label %if.then46

if.then46:                                        ; preds = %if.end44
  br i1 %cmp53, label %if.then46.for.end80_crit_edge, label %if.then49

if.then46.for.end80_crit_edge:                    ; preds = %if.then46
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.end80

if.then49:                                        ; preds = %if.then46
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %call50 = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.1, i64 0, i64 0), i32 %proglen.0.lcssa.i, i32 %oldproglen.1406) #16
  br label %out_image

if.end52:                                         ; preds = %if.end44
  br i1 %cmp53, label %if.then55, label %if.end52.if.end75_crit_edge

if.end52.if.end75_crit_edge:                      ; preds = %if.end52
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end75

if.then55:                                        ; preds = %if.end52
  %891 = ptrtoint %struct.bpf_prog_aux** %aux to i64
  call void @__asan_load8_noabort(i64 %891)
  %892 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %aux, align 8
  %num_exentries = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %892, i64 0, i32 44
  %893 = ptrtoint i32* %num_exentries to i64
  call void @__asan_load4_noabort(i64 %893)
  %894 = load i32, i32* %num_exentries, align 4
  %mul = mul i32 %894, 12
  %add60 = add nuw i32 %oldproglen.1406, 3
  %div = and i32 %add60, -4
  %add62 = add i32 %mul, %div
  %call63 = call %struct.bpf_binary_header* @bpf_jit_binary_alloc(i32 %add62, i8** nonnull %image, i32 4, void (i8*, i32)* nonnull @jit_fill_hole) #13
  %tobool64 = icmp eq %struct.bpf_binary_header* %call63, null
  br i1 %tobool64, label %if.then55.out_addrs_crit_edge, label %cleanup.thread

if.then55.out_addrs_crit_edge:                    ; preds = %if.then55
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %out_addrs

cleanup.thread:                                   ; preds = %if.then55
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %895 = ptrtoint i8** %image to i64
  call void @__asan_load8_noabort(i64 %895)
  %896 = load i8*, i8** %image, align 8
  %idx.ext = zext i32 %div to i64
  %add.ptr = getelementptr i8, i8* %896, i64 %idx.ext
  %897 = ptrtoint %struct.bpf_prog_aux** %aux to i64
  call void @__asan_load8_noabort(i64 %897)
  %898 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %aux, align 8
  %extable = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %898, i64 0, i32 45
  %899 = bitcast %struct.exception_table_entry** %extable to i8**
  %900 = ptrtoint i8** %899 to i64
  call void @__asan_store8_noabort(i64 %900)
  store i8* %add.ptr, i8** %899, align 8
  br label %if.end75

if.end75:                                         ; preds = %if.end52.if.end75_crit_edge, %cleanup.thread
  %header.2 = phi %struct.bpf_binary_header* [ %header.1408, %if.end52.if.end75_crit_edge ], [ %call63, %cleanup.thread ]
  call void @___might_sleep(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str, i64 0, i64 0), i32 1920, i32 0) #13
  %call77 = call i32 @_cond_resched() #13
  %inc79 = add i32 %pass.0407, 1
  call void @__sanitizer_cov_trace_const_cmp4(i32 19, i32 %inc79)
  %cmp33 = icmp sgt i32 %inc79, 19
  %901 = ptrtoint i8** %image to i64
  call void @__asan_load8_noabort(i64 %901)
  %.pr = load i8*, i8** %image, align 8
  %tobool35 = icmp eq i8* %.pr, null
  %or.cond = and i1 %cmp33, %tobool35
  br i1 %or.cond, label %if.end75.for.end80_crit_edge, label %if.end75.for.body36_crit_edge

if.end75.for.body36_crit_edge:                    ; preds = %if.end75
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.body36

if.end75.for.end80_crit_edge:                     ; preds = %if.end75
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.end80

for.end80:                                        ; preds = %if.end75.for.end80_crit_edge, %if.then46.for.end80_crit_edge
  %proglen.0.lcssa.i476 = phi i32 [ %oldproglen.1406, %if.then46.for.end80_crit_edge ], [ %proglen.0.lcssa.i, %if.end75.for.end80_crit_edge ]
  %pass.0325 = phi i32 [ %pass.0407, %if.then46.for.end80_crit_edge ], [ %inc79, %if.end75.for.end80_crit_edge ]
  %header.1308 = phi %struct.bpf_binary_header* [ %header.1408, %if.then46.for.end80_crit_edge ], [ %header.2, %if.end75.for.end80_crit_edge ]
  call void @__asan_load4_noabort(i64 ptrtoint (i32* @bpf_jit_enable to i64))
  %902 = load i32, i32* @bpf_jit_enable, align 4
  call void @__sanitizer_cov_trace_const_cmp4(i32 1, i32 %902)
  %cmp81 = icmp sgt i32 %902, 1
  br i1 %cmp81, label %if.then83, label %for.end80.if.end86_crit_edge

for.end80.if.end86_crit_edge:                     ; preds = %for.end80
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end86

if.then83:                                        ; preds = %for.end80
  %903 = ptrtoint i32* %len.i to i64
  call void @__asan_load4_noabort(i64 %903)
  %904 = load i32, i32* %len.i, align 4
  %add85 = add i32 %pass.0325, 1
  %905 = ptrtoint i8** %image to i64
  call void @__asan_load8_noabort(i64 %905)
  %906 = load i8*, i8** %image, align 8
  %907 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** nonnull @current_task) #18, !srcloc !50
  %arraydecay.i246 = getelementptr inbounds %struct.task_struct, %struct.task_struct* %907, i64 0, i32 94, i64 0
  %pid.i.i = getelementptr inbounds %struct.task_struct, %struct.task_struct* %907, i64 0, i32 62
  %908 = ptrtoint i32* %pid.i.i to i64
  call void @__asan_load4_noabort(i64 %908)
  %909 = load i32, i32* %pid.i.i, align 8
  %call3.i = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.15, i64 0, i64 0), i32 %904, i32 %proglen.0.lcssa.i476, i32 %add85, i8* %906, i8* %arraydecay.i246, i32 %909) #16
  %tobool.i = icmp eq i8* %906, null
  br i1 %tobool.i, label %if.then83.if.end86_crit_edge, label %if.then.i

if.then83.if.end86_crit_edge:                     ; preds = %if.then83
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end86

if.then.i:                                        ; preds = %if.then83
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %conv.i247 = zext i32 %proglen.0.lcssa.i476 to i64
  call void @print_hex_dump(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.16, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.17, i64 0, i64 0), i32 2, i32 16, i32 1, i8* nonnull %906, i64 %conv.i247, i1 zeroext false) #13
  br label %if.end86

if.end86:                                         ; preds = %if.then83.if.end86_crit_edge, %for.end80.if.end86_crit_edge, %if.then.i
  %910 = ptrtoint i8** %image to i64
  call void @__asan_load8_noabort(i64 %910)
  %911 = load i8*, i8** %image, align 8
  %tobool87 = icmp eq i8* %911, null
  br i1 %tobool87, label %if.end86.out_addrs_crit_edge, label %if.then88

if.end86.out_addrs_crit_edge:                     ; preds = %if.end86
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %out_addrs

if.then88:                                        ; preds = %if.end86
  %is_func = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %call, i64 0, i32 1
  %912 = ptrtoint i16* %is_func to i64
  call void @__asan_load2_noabort(i64 %912)
  %bf.load89 = load i16, i16* %is_func, align 2
  %bf.clear91 = and i16 %bf.load89, 64
  call void @__sanitizer_cov_trace_const_cmp2(i16 0, i16 %bf.clear91)
  %tobool92 = icmp eq i16 %bf.clear91, 0
  %brmerge = or i1 %extra_pass.0, %tobool92
  br i1 %brmerge, label %if.then95, label %if.else

if.then95:                                        ; preds = %if.then88
  %913 = ptrtoint %struct.bpf_prog_aux** %aux to i64
  call void @__asan_load8_noabort(i64 %913)
  %914 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %aux, align 8
  %size_poke_tab105.i = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %914, i64 0, i32 25
  %915 = ptrtoint i32* %size_poke_tab105.i to i64
  call void @__asan_load4_noabort(i64 %915)
  %916 = load i32, i32* %size_poke_tab105.i, align 8
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %916)
  %cmp106.i = icmp eq i32 %916, 0
  br i1 %cmp106.i, label %if.then95.bpf_tail_call_direct_fixup.exit_crit_edge, label %if.then95.for.body.i251_crit_edge

if.then95.for.body.i251_crit_edge:                ; preds = %if.then95
  br label %for.body.i251

if.then95.bpf_tail_call_direct_fixup.exit_crit_edge: ; preds = %if.then95
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %bpf_tail_call_direct_fixup.exit

for.body.i251:                                    ; preds = %for.inc.i257.for.body.i251_crit_edge, %if.then95.for.body.i251_crit_edge
  %917 = phi %struct.bpf_prog_aux* [ %945, %for.inc.i257.for.body.i251_crit_edge ], [ %914, %if.then95.for.body.i251_crit_edge ]
  %i.0107.i = phi i32 [ %inc.i255, %for.inc.i257.for.body.i251_crit_edge ], [ 0, %if.then95.for.body.i251_crit_edge ]
  %poke_tab.i249 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %917, i64 0, i32 24
  %918 = ptrtoint %struct.bpf_jit_poke_descriptor** %poke_tab.i249 to i64
  call void @__asan_load8_noabort(i64 %918)
  %919 = load %struct.bpf_jit_poke_descriptor*, %struct.bpf_jit_poke_descriptor** %poke_tab.i249, align 8
  %idxprom.i250 = sext i32 %i.0107.i to i64
  %ip_stable.i = getelementptr %struct.bpf_jit_poke_descriptor, %struct.bpf_jit_poke_descriptor* %919, i64 %idxprom.i250, i32 2
  %920 = ptrtoint i8* %ip_stable.i to i64
  call void @__asan_load1_noabort(i64 %920)
  %921 = load volatile i8, i8* %ip_stable.i, align 8, !range !51
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %921)
  %tobool17.i = icmp eq i8 %921, 0
  br i1 %tobool17.i, label %for.body.i251.if.end.i_crit_edge, label %do.body18.i, !prof !52, !misexpect !45

for.body.i251.if.end.i_crit_edge:                 ; preds = %for.body.i251
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end.i

do.body18.i:                                      ; preds = %for.body.i251
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  call void asm sideeffect "${0:c}:\0A\09.pushsection .discard.instr_begin\0A\09.long ${0:c}b - .\0A\09.popsection\0A\09", "i,~{dirflag},~{fpsr},~{flags}"(i32 1299) #15, !srcloc !53
  call void asm sideeffect "1:\09.byte 0x0f, 0x0b\0A.pushsection __bug_table,\22aw\22\0A2:\09.long 1b - 2b\09# bug_entry::bug_addr\0A\09.long ${0:c} - 2b\09# bug_entry::file\0A\09.word ${1:c}\09# bug_entry::line\0A\09.word ${2:c}\09# bug_entry::flags\0A\09.org 2b+${3:c}\0A.popsection", "i,i,i,i,~{dirflag},~{fpsr},~{flags}"(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str, i64 0, i64 0), i32 456, i32 2307, i64 12) #15, !srcloc !54
  call void asm sideeffect "${0:c}:\0A\09.pushsection .discard.reachable\0A\09.long ${0:c}b - .\0A\09.popsection\0A\09", "i,~{dirflag},~{fpsr},~{flags}"(i32 1300) #15, !srcloc !55
  call void asm sideeffect "${0:c}: nop\0A\09.pushsection .discard.instr_end\0A\09.long ${0:c}b - .\0A\09.popsection\0A\09", "i,~{dirflag},~{fpsr},~{flags}"(i32 1301) #15, !srcloc !56
  br label %if.end.i

if.end.i:                                         ; preds = %for.body.i251.if.end.i_crit_edge, %do.body18.i
  %reason.i = getelementptr %struct.bpf_jit_poke_descriptor, %struct.bpf_jit_poke_descriptor* %919, i64 %idxprom.i250, i32 4
  %922 = ptrtoint i16* %reason.i to i64
  call void @__asan_load2_noabort(i64 %922)
  %923 = load i16, i16* %reason.i, align 2
  call void @__sanitizer_cov_trace_const_cmp2(i16 0, i16 %923)
  %cmp33.i = icmp eq i16 %923, 0
  br i1 %cmp33.i, label %if.end36.i, label %if.end.i.for.inc.i257_crit_edge

if.end.i.for.inc.i257_crit_edge:                  ; preds = %if.end.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.inc.i257

if.end36.i:                                       ; preds = %if.end.i
  %tail_call.i = getelementptr %struct.bpf_jit_poke_descriptor, %struct.bpf_jit_poke_descriptor* %919, i64 %idxprom.i250, i32 1, i32 0
  %924 = bitcast %struct.anon.6* %tail_call.i to %struct.bpf_array**
  %925 = ptrtoint %struct.bpf_array** %924 to i64
  call void @__asan_load8_noabort(i64 %925)
  %926 = load %struct.bpf_array*, %struct.bpf_array** %924, align 8
  %aux41.i = getelementptr inbounds %struct.bpf_array, %struct.bpf_array* %926, i64 0, i32 3
  %927 = ptrtoint %struct.bpf_array_aux** %aux41.i to i64
  call void @__asan_load8_noabort(i64 %927)
  %928 = load %struct.bpf_array_aux*, %struct.bpf_array_aux** %aux41.i, align 8
  %poke_mutex.i = getelementptr inbounds %struct.bpf_array_aux, %struct.bpf_array_aux* %928, i64 0, i32 4
  call void @mutex_lock_nested(%struct.mutex* %poke_mutex.i, i32 0) #13
  %key.i = getelementptr %struct.bpf_jit_poke_descriptor, %struct.bpf_jit_poke_descriptor* %919, i64 %idxprom.i250, i32 1, i32 0, i32 1
  %929 = ptrtoint i32* %key.i to i64
  call void @__asan_load4_noabort(i64 %929)
  %930 = load i32, i32* %key.i, align 8
  %idxprom43.i = zext i32 %930 to i64
  %arrayidx44.i = getelementptr %struct.bpf_array, %struct.bpf_array* %926, i64 0, i32 4, i32 0, i64 %idxprom43.i
  %931 = bitcast i8** %arrayidx44.i to %struct.bpf_prog**
  %932 = ptrtoint %struct.bpf_prog** %931 to i64
  call void @__asan_load8_noabort(i64 %932)
  %933 = load %struct.bpf_prog*, %struct.bpf_prog** %931, align 8
  %tobool45.i = icmp eq %struct.bpf_prog* %933, null
  br i1 %tobool45.i, label %if.end36.i.do.body77.i_crit_edge, label %if.then46.i

if.end36.i.do.body77.i_crit_edge:                 ; preds = %if.end36.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body77.i

if.then46.i:                                      ; preds = %if.end36.i
  %ip.i = getelementptr %struct.bpf_jit_poke_descriptor, %struct.bpf_jit_poke_descriptor* %919, i64 %idxprom.i250, i32 0
  %934 = ptrtoint i8** %ip.i to i64
  call void @__asan_load8_noabort(i64 %934)
  %935 = load i8*, i8** %ip.i, align 8
  %bpf_func.i = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %933, i64 0, i32 9
  %936 = bitcast i32 (i8*, %struct.bpf_insn*)** %bpf_func.i to i8**
  %937 = ptrtoint i8** %936 to i64
  call void @__asan_load8_noabort(i64 %937)
  %938 = load i8*, i8** %936, align 8
  %adj_off.i = getelementptr %struct.bpf_jit_poke_descriptor, %struct.bpf_jit_poke_descriptor* %919, i64 %idxprom.i250, i32 3
  %939 = ptrtoint i8* %adj_off.i to i64
  call void @__asan_load1_noabort(i64 %939)
  %940 = load i8, i8* %adj_off.i, align 1
  %idx.ext.i252 = zext i8 %940 to i64
  %add.ptr48.i = getelementptr i8, i8* %938, i64 %idx.ext.i252
  %call.i253 = call fastcc i32 @__bpf_arch_text_poke(i8* %935, i32 1, i8* null, i8* %add.ptr48.i, i1 zeroext false) #13
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %call.i253)
  %tobool58.i = icmp slt i32 %call.i253, 0
  br i1 %tobool58.i, label %do.body60.i254, label %if.then46.i.do.body77.i_crit_edge, !prof !44, !misexpect !45

if.then46.i.do.body77.i_crit_edge:                ; preds = %if.then46.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %do.body77.i

do.body60.i254:                                   ; preds = %if.then46.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  call void asm sideeffect "${0:c}:\0A\09.pushsection .discard.instr_begin\0A\09.long ${0:c}b - .\0A\09.popsection\0A\09", "i,~{dirflag},~{fpsr},~{flags}"(i32 1303) #15, !srcloc !57
  call void asm sideeffect "1:\09.byte 0x0f, 0x0b\0A.pushsection __bug_table,\22aw\22\0A2:\09.long 1b - 2b\09# bug_entry::bug_addr\0A\09.long ${0:c} - 2b\09# bug_entry::file\0A\09.word ${1:c}\09# bug_entry::line\0A\09.word ${2:c}\09# bug_entry::flags\0A\09.org 2b+${3:c}\0A.popsection", "i,i,i,i,~{dirflag},~{fpsr},~{flags}"(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str, i64 0, i64 0), i32 476, i32 0, i64 12) #15, !srcloc !58
  call void asm sideeffect "${0:c}:\0A\09.pushsection .discard.unreachable\0A\09.long ${0:c}b - .\0A\09.popsection\0A\09", "i,~{dirflag},~{fpsr},~{flags}"(i32 1304) #15, !srcloc !59
  unreachable

do.body77.i:                                      ; preds = %if.then46.i.do.body77.i_crit_edge, %if.end36.i.do.body77.i_crit_edge
  %941 = ptrtoint i8* %ip_stable.i to i64
  call void @__asan_store1_noabort(i64 %941)
  store volatile i8 1, i8* %ip_stable.i, align 8
  %942 = ptrtoint %struct.bpf_array_aux** %aux41.i to i64
  call void @__asan_load8_noabort(i64 %942)
  %943 = load %struct.bpf_array_aux*, %struct.bpf_array_aux** %aux41.i, align 8
  %poke_mutex84.i = getelementptr inbounds %struct.bpf_array_aux, %struct.bpf_array_aux* %943, i64 0, i32 4
  call void @mutex_unlock(%struct.mutex* %poke_mutex84.i) #13
  br label %for.inc.i257

for.inc.i257:                                     ; preds = %if.end.i.for.inc.i257_crit_edge, %do.body77.i
  %inc.i255 = add nuw i32 %i.0107.i, 1
  %944 = ptrtoint %struct.bpf_prog_aux** %aux to i64
  call void @__asan_load8_noabort(i64 %944)
  %945 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %aux, align 8
  %size_poke_tab.i = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %945, i64 0, i32 25
  %946 = ptrtoint i32* %size_poke_tab.i to i64
  call void @__asan_load4_noabort(i64 %946)
  %947 = load i32, i32* %size_poke_tab.i, align 8
  %cmp.i256 = icmp ult i32 %inc.i255, %947
  br i1 %cmp.i256, label %for.inc.i257.for.body.i251_crit_edge, label %for.inc.i257.bpf_tail_call_direct_fixup.exit_crit_edge

for.inc.i257.bpf_tail_call_direct_fixup.exit_crit_edge: ; preds = %for.inc.i257
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %bpf_tail_call_direct_fixup.exit

for.inc.i257.for.body.i251_crit_edge:             ; preds = %for.inc.i257
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.body.i251

bpf_tail_call_direct_fixup.exit:                  ; preds = %for.inc.i257.bpf_tail_call_direct_fixup.exit_crit_edge, %if.then95.bpf_tail_call_direct_fixup.exit_crit_edge
  %948 = bitcast %struct.bpf_binary_header* %header.1308 to i8*
  %call.i.i = call %struct.vm_struct* @find_vm_area(i8* %948) #13
  %tobool.i.i = icmp eq %struct.vm_struct* %call.i.i, null
  br i1 %tobool.i.i, label %bpf_tail_call_direct_fixup.exit.bpf_jit_binary_lock_ro.exit_crit_edge, label %if.then.i.i

bpf_tail_call_direct_fixup.exit.bpf_jit_binary_lock_ro.exit_crit_edge: ; preds = %bpf_tail_call_direct_fixup.exit
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %bpf_jit_binary_lock_ro.exit

if.then.i.i:                                      ; preds = %bpf_tail_call_direct_fixup.exit
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %flags.i.i = getelementptr inbounds %struct.vm_struct, %struct.vm_struct* %call.i.i, i64 0, i32 3
  %949 = ptrtoint i64* %flags.i.i to i64
  call void @__asan_load8_noabort(i64 %949)
  %950 = load i64, i64* %flags.i.i, align 8
  %or.i.i = or i64 %950, 256
  store i64 %or.i.i, i64* %flags.i.i, align 8
  br label %bpf_jit_binary_lock_ro.exit

bpf_jit_binary_lock_ro.exit:                      ; preds = %bpf_tail_call_direct_fixup.exit.bpf_jit_binary_lock_ro.exit_crit_edge, %if.then.i.i
  %951 = ptrtoint %struct.bpf_binary_header* %header.1308 to i64
  %pages.i = getelementptr inbounds %struct.bpf_binary_header, %struct.bpf_binary_header* %header.1308, i64 0, i32 0
  %952 = ptrtoint i32* %pages.i to i64
  call void @__asan_load4_noabort(i64 %952)
  %953 = load i32, i32* %pages.i, align 8
  %call.i = call i32 @set_memory_ro(i64 %951, i32 %953) #13
  %954 = ptrtoint i32* %pages.i to i64
  call void @__asan_load4_noabort(i64 %954)
  %955 = load i32, i32* %pages.i, align 8
  %call2.i = call i32 @set_memory_x(i64 %951, i32 %955) #13
  %.pre = bitcast i8** %image to i64*
  br label %if.end105

if.else:                                          ; preds = %if.then88
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %956 = ptrtoint i32** %addrs16 to i64
  call void @__asan_store8_noabort(i64 %956)
  store i32* %addrs.0, i32** %addrs16, align 8
  %957 = getelementptr inbounds %struct.x64_jit_data, %struct.x64_jit_data* %jit_data.0, i64 0, i32 4, i32 0
  %958 = ptrtoint i32* %957 to i64
  call void @__asan_store4_noabort(i64 %958)
  store i32 %ctx.sroa.0.4, i32* %957, align 4
  %proglen98 = getelementptr inbounds %struct.x64_jit_data, %struct.x64_jit_data* %jit_data.0, i64 0, i32 3
  %959 = ptrtoint i32* %proglen98 to i64
  call void @__asan_store4_noabort(i64 %959)
  store i32 %proglen.0.lcssa.i476, i32* %proglen98, align 8
  %960 = bitcast i8** %image to i64*
  %961 = ptrtoint i64* %960 to i64
  call void @__asan_load8_noabort(i64 %961)
  %962 = load i64, i64* %960, align 8
  %image99 = getelementptr inbounds %struct.x64_jit_data, %struct.x64_jit_data* %jit_data.0, i64 0, i32 2
  %963 = bitcast i8** %image99 to i64*
  %964 = ptrtoint i64* %963 to i64
  call void @__asan_store8_noabort(i64 %964)
  store i64 %962, i64* %963, align 8
  %header100 = getelementptr inbounds %struct.x64_jit_data, %struct.x64_jit_data* %jit_data.0, i64 0, i32 0
  %965 = ptrtoint %struct.bpf_binary_header** %header100 to i64
  call void @__asan_store8_noabort(i64 %965)
  store %struct.bpf_binary_header* %header.1308, %struct.bpf_binary_header** %header100, align 8
  br label %if.end105

if.end105:                                        ; preds = %bpf_jit_binary_lock_ro.exit, %if.else
  %.pre-phi = phi i64* [ %.pre, %bpf_jit_binary_lock_ro.exit ], [ %960, %if.else ]
  %966 = ptrtoint i64* %.pre-phi to i64
  call void @__asan_load8_noabort(i64 %966)
  %967 = load i64, i64* %.pre-phi, align 8
  %bpf_func = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %call, i64 0, i32 9
  %968 = bitcast i32 (i8*, %struct.bpf_insn*)** %bpf_func to i64*
  %969 = ptrtoint i64* %968 to i64
  call void @__asan_store8_noabort(i64 %969)
  store i64 %967, i64* %968, align 8
  %970 = ptrtoint i16* %is_func to i64
  call void @__asan_load2_noabort(i64 %970)
  %bf.load102 = load i16, i16* %is_func, align 2
  %bf.set = or i16 %bf.load102, 1
  store i16 %bf.set, i16* %is_func, align 2
  %jited_len = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %call, i64 0, i32 5
  %971 = ptrtoint i32* %jited_len to i64
  call void @__asan_store4_noabort(i64 %971)
  store i32 %proglen.0.lcssa.i476, i32* %jited_len, align 8
  %972 = ptrtoint i8** %image to i64
  call void @__asan_load8_noabort(i64 %972)
  %.pr268 = load i8*, i8** %image, align 8
  %tobool106 = icmp eq i8* %.pr268, null
  br i1 %tobool106, label %if.end105.out_addrs_crit_edge, label %lor.lhs.false107

if.end105.out_addrs_crit_edge:                    ; preds = %if.end105
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %out_addrs

lor.lhs.false107:                                 ; preds = %if.end105
  %973 = ptrtoint i16* %is_func to i64
  call void @__asan_load2_noabort(i64 %973)
  %bf.load109 = load i16, i16* %is_func, align 2
  %bf.clear111 = and i16 %bf.load109, 64
  call void @__sanitizer_cov_trace_const_cmp2(i16 0, i16 %bf.clear111)
  %tobool112 = icmp eq i16 %bf.clear111, 0
  %brmerge240 = or i1 %extra_pass.0, %tobool112
  br i1 %brmerge240, label %if.then118, label %lor.lhs.false107.out_crit_edge

lor.lhs.false107.out_crit_edge:                   ; preds = %lor.lhs.false107
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %out

if.then118:                                       ; preds = %lor.lhs.false107
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %add.ptr119 = getelementptr i32, i32* %addrs.0, i64 1
  call void @bpf_prog_fill_jited_linfo(%struct.bpf_prog* %call, i32* %add.ptr119) #13
  br label %out_addrs

out_addrs:                                        ; preds = %if.end105.out_addrs_crit_edge, %if.end86.out_addrs_crit_edge, %if.then55.out_addrs_crit_edge, %out_image.out_addrs_crit_edge, %if.end23.out_addrs_crit_edge, %if.then42, %if.then118
  %addrs.1 = phi i32* [ %addrs.0, %if.then118 ], [ null, %if.end23.out_addrs_crit_edge ], [ %addrs.0, %out_image.out_addrs_crit_edge ], [ %addrs.0, %if.then42 ], [ %addrs.0, %if.end86.out_addrs_crit_edge ], [ %addrs.0, %if.end105.out_addrs_crit_edge ], [ %addrs.0, %if.then55.out_addrs_crit_edge ]
  %prog.addr.5 = phi %struct.bpf_prog* [ %call, %if.then118 ], [ %prog, %if.end23.out_addrs_crit_edge ], [ %prog, %out_image.out_addrs_crit_edge ], [ %prog, %if.then42 ], [ %prog, %if.end86.out_addrs_crit_edge ], [ %call, %if.end105.out_addrs_crit_edge ], [ %prog, %if.then55.out_addrs_crit_edge ]
  %974 = bitcast i32* %addrs.1 to i8*
  call void @kfree(i8* %974) #13
  %975 = bitcast %struct.x64_jit_data* %jit_data.0 to i8*
  call void @kfree(i8* %975) #13
  %aux121 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %prog.addr.5, i64 0, i32 7
  %976 = ptrtoint %struct.bpf_prog_aux** %aux121 to i64
  call void @__asan_load8_noabort(i64 %976)
  %977 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %aux121, align 8
  %jit_data122 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %977, i64 0, i32 23
  %978 = ptrtoint i8** %jit_data122 to i64
  call void @__asan_store8_noabort(i64 %978)
  store i8* null, i8** %jit_data122, align 8
  br label %out

out:                                              ; preds = %lor.lhs.false107.out_crit_edge, %if.then8.out_crit_edge, %out_addrs
  %prog.addr.6 = phi %struct.bpf_prog* [ %prog.addr.5, %out_addrs ], [ %prog, %if.then8.out_crit_edge ], [ %call, %lor.lhs.false107.out_crit_edge ]
  br i1 %cmp, label %out.cleanup129_crit_edge, label %if.then125

out.cleanup129_crit_edge:                         ; preds = %out
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %cleanup129

if.then125:                                       ; preds = %out
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %cmp126 = icmp eq %struct.bpf_prog* %prog.addr.6, %prog
  %call.prog = select i1 %cmp126, %struct.bpf_prog* %call, %struct.bpf_prog* %prog
  call void @bpf_jit_prog_release_other(%struct.bpf_prog* %prog.addr.6, %struct.bpf_prog* %call.prog) #13
  br label %cleanup129

cleanup129:                                       ; preds = %out.cleanup129_crit_edge, %if.end.cleanup129_crit_edge, %entry.cleanup129_crit_edge, %if.then125
  %retval.0 = phi %struct.bpf_prog* [ %prog, %entry.cleanup129_crit_edge ], [ %prog, %if.end.cleanup129_crit_edge ], [ %prog.addr.6, %if.then125 ], [ %prog.addr.6, %out.cleanup129_crit_edge ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0) #15
  ret %struct.bpf_prog* %retval.0
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noredzone
declare dso_local %struct.bpf_prog* @bpf_jit_blind_constants(%struct.bpf_prog*) local_unnamed_addr #1

; Function Attrs: inlinehint noredzone nounwind sanitize_address sspstrong
define internal fastcc i8* @kmalloc_array(i64 %n, i64 %size, i32 %flags) unnamed_addr #4 {
entry:
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %0 = tail call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %n, i64 %size)
  %1 = extractvalue { i64, i1 } %0, 1
  br i1 %1, label %entry.cleanup_crit_edge, label %if.end7, !prof !44, !misexpect !45

entry.cleanup_crit_edge:                          ; preds = %entry
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %cleanup

if.end7:                                          ; preds = %entry
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2 = extractvalue { i64, i1 } %0, 0
  %call8 = tail call noalias i8* @__kmalloc(i64 %2, i32 %flags) #13
  %ptrint = ptrtoint i8* %call8 to i64
  %maskedptr = and i64 %ptrint, 7
  call void @__sanitizer_cov_trace_const_cmp8(i64 0, i64 %maskedptr)
  %maskcond = icmp eq i64 %maskedptr, 0
  tail call void @llvm.assume(i1 %maskcond)
  br label %cleanup

cleanup:                                          ; preds = %entry.cleanup_crit_edge, %if.end7
  %retval.0 = phi i8* [ %call8, %if.end7 ], [ null, %entry.cleanup_crit_edge ]
  ret i8* %retval.0
}

; Function Attrs: noredzone
declare dso_local void @bpf_jit_binary_free(%struct.bpf_binary_header*) local_unnamed_addr #1

; Function Attrs: cold noredzone
declare dso_local i32 @printk(i8*, ...) local_unnamed_addr #5

; Function Attrs: noredzone
declare dso_local %struct.bpf_binary_header* @bpf_jit_binary_alloc(i32, i8**, i32, void (i8*, i32)*) local_unnamed_addr #1

; Function Attrs: nofree noredzone nounwind sanitize_address sspstrong
define internal void @jit_fill_hole(i8* %area, i32 %size) #6 {
entry:
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %conv = zext i32 %size to i64
  %call = tail call i8* @memset(i8* %area, i32 204, i64 %conv) #13
  ret void
}

; Function Attrs: noredzone
declare dso_local void @___might_sleep(i8*, i32, i32) local_unnamed_addr #1

; Function Attrs: noredzone
declare dso_local i32 @_cond_resched() local_unnamed_addr #1

; Function Attrs: noredzone
declare dso_local void @bpf_prog_fill_jited_linfo(%struct.bpf_prog*, i32*) local_unnamed_addr #1

; Function Attrs: noredzone
declare dso_local void @bpf_jit_prog_release_other(%struct.bpf_prog*, %struct.bpf_prog*) local_unnamed_addr #1

; Function Attrs: noredzone
declare dso_local i32 @in_gate_area_no_mm(i64) local_unnamed_addr #1

; Function Attrs: nobuiltin nofree noredzone nounwind
declare dso_local i8* @memcpy(i8* noalias returned, i8* noalias nocapture readonly, i64) local_unnamed_addr #7

; Function Attrs: noredzone
declare dso_local void @mutex_lock_nested(%struct.mutex*, i32) local_unnamed_addr #1

; Function Attrs: nobuiltin nofree noredzone nounwind readonly
declare dso_local i32 @memcmp(i8* nocapture, i8* nocapture, i64) local_unnamed_addr #8

; Function Attrs: noredzone
declare dso_local void @text_poke_bp(i8*, i8*, i64, i8*) local_unnamed_addr #1

; Function Attrs: noredzone
declare dso_local void @mutex_unlock(%struct.mutex*) local_unnamed_addr #1

; Function Attrs: noredzone nounwind sanitize_address sspstrong
define internal fastcc i32 @invoke_bpf_prog(i8** nocapture %pprog, %struct.bpf_prog* %p, i32 %stack_size, i1 zeroext %mod_ret) unnamed_addr #0 {
entry:
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %0 = ptrtoint i8** %pprog to i64
  call void @__asan_load8_noabort(i64 %0)
  %1 = load i8*, i8** %pprog, align 8
  %add.ptr.i.i = getelementptr i8, i8* %1, i64 5
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %add.ptr.i.i to i64
  %2 = sub i64 add (i64 ptrtoint (i64 ()* @__bpf_prog_enter to i64), i64 2147483648), %sub.ptr.rhs.cast.i.i
  call void @__sanitizer_cov_trace_const_cmp8(i64 4294967296, i64 %2)
  %3 = icmp ult i64 %2, 4294967296
  br i1 %3, label %if.end, label %emit_call.exit

emit_call.exit:                                   ; preds = %entry
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %call1.i.i = tail call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.2, i64 0, i64 0), i8* bitcast (i64 ()* @__bpf_prog_enter to i8*)) #16
  br label %cleanup

if.end:                                           ; preds = %entry
  %4 = ptrtoint i8* %1 to i64
  call void @__asan_store1_noabort(i64 %4)
  store i8 -24, i8* %1, align 1
  %add.ptr.i23.i.i = getelementptr i8, i8* %1, i64 1
  %5 = trunc i64 %sub.ptr.rhs.cast.i.i to i32
  %conv5.i.i = sub i32 ptrtoint (i64 ()* @__bpf_prog_enter to i32), %5
  %6 = bitcast i8* %add.ptr.i23.i.i to i32*
  %7 = ptrtoint i32* %6 to i64
  call void @__asan_store4_noabort(i64 %7)
  store i32 %conv5.i.i, i32* %6, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %8 = bitcast i8* %add.ptr.i.i to i32*
  %9 = ptrtoint i32* %8 to i64
  call void @__asan_store4_noabort(i64 %9)
  store i32 12814664, i32* %8, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i61.i = getelementptr i8, i8* %1, i64 8
  %sub = shl i32 %stack_size, 24
  %add = sub i32 8228168, %sub
  %10 = bitcast i8* %add.ptr.i61.i to i32*
  %11 = ptrtoint i32* %10 to i64
  call void @__asan_store4_noabort(i64 %11)
  store i32 %add, i32* %10, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i = getelementptr i8, i8* %1, i64 12
  %jited = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %p, i64 0, i32 1
  %12 = ptrtoint i16* %jited to i64
  call void @__asan_load2_noabort(i64 %12)
  %bf.load = load i16, i16* %jited, align 2
  %bf.clear = and i16 %bf.load, 1
  call void @__sanitizer_cov_trace_const_cmp2(i16 0, i16 %bf.clear)
  %tobool3 = icmp eq i16 %bf.clear, 0
  br i1 %tobool3, label %if.then4, label %if.end.if.end8_crit_edge

if.end.if.end8_crit_edge:                         ; preds = %if.end
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end8

if.then4:                                         ; preds = %if.end
  %arraydecay = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %p, i64 0, i32 11, i64 0
  %13 = ptrtoint %struct.bpf_insn* %arraydecay to i64
  %14 = lshr i64 %13, 32
  %conv = trunc i64 %14 to i32
  %conv7 = trunc i64 %13 to i32
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %conv)
  %15 = icmp eq i32 %conv, 0
  br i1 %15, label %if.then.i, label %do.body.i

if.then.i:                                        ; preds = %if.then4
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %conv7)
  %cmp16.i.i = icmp eq i32 %conv7, 0
  br i1 %cmp16.i.i, label %if.then18.i.i, label %if.end39.i.i

if.then18.i.i:                                    ; preds = %if.then.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %16 = bitcast i8* %add.ptr.i to i16*
  %17 = ptrtoint i16* %16 to i64
  call void @__asan_store2_noabort(i64 %17)
  store i16 -2511, i16* %16, align 2
  %add.ptr.i102.i.i = getelementptr i8, i8* %1, i64 14
  br label %if.end8

if.end39.i.i:                                     ; preds = %if.then.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %18 = ptrtoint i8* %add.ptr.i to i64
  call void @__asan_store1_noabort(i64 %18)
  store i8 -66, i8* %add.ptr.i, align 1
  %add.ptr.i94.i.i = getelementptr i8, i8* %1, i64 13
  %19 = bitcast i8* %add.ptr.i94.i.i to i32*
  %20 = ptrtoint i32* %19 to i64
  call void @__asan_store4_noabort(i64 %20)
  store i32 %conv7, i32* %19, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i.i.i1 = getelementptr i8, i8* %1, i64 17
  br label %if.end8

do.body.i:                                        ; preds = %if.then4
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %21 = bitcast i8* %add.ptr.i to i16*
  %22 = ptrtoint i16* %21 to i64
  call void @__asan_store2_noabort(i64 %22)
  store i16 -16824, i16* %21, align 2
  %add.ptr.i31.i = getelementptr i8, i8* %1, i64 14
  %23 = bitcast i8* %add.ptr.i31.i to i32*
  %24 = ptrtoint i32* %23 to i64
  call void @__asan_store4_noabort(i64 %24)
  store i32 %conv7, i32* %23, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i30.i = getelementptr i8, i8* %1, i64 18
  %25 = bitcast i8* %add.ptr.i30.i to i32*
  %26 = ptrtoint i32* %25 to i64
  call void @__asan_store4_noabort(i64 %26)
  store i32 %conv, i32* %25, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i.i2 = getelementptr i8, i8* %1, i64 22
  br label %if.end8

if.end8:                                          ; preds = %if.end.if.end8_crit_edge, %do.body.i, %if.end39.i.i, %if.then18.i.i
  %prog.sroa.0.1.in = phi i8* [ %add.ptr.i, %if.end.if.end8_crit_edge ], [ %add.ptr.i.i2, %do.body.i ], [ %add.ptr.i102.i.i, %if.then18.i.i ], [ %add.ptr.i.i.i1, %if.end39.i.i ]
  %bpf_func = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %p, i64 0, i32 9
  %27 = bitcast i32 (i8*, %struct.bpf_insn*)** %bpf_func to i8**
  %28 = ptrtoint i8** %27 to i64
  call void @__asan_load8_noabort(i64 %28)
  %29 = load i8*, i8** %27, align 8
  %add.ptr.i.i3 = getelementptr i8, i8* %prog.sroa.0.1.in, i64 5
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %29 to i64
  %sub.ptr.rhs.cast.i.i4 = ptrtoint i8* %add.ptr.i.i3 to i64
  %sub.ptr.sub.i.i5 = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i4
  %30 = add i64 %sub.ptr.sub.i.i5, 2147483648
  call void @__sanitizer_cov_trace_const_cmp8(i64 4294967296, i64 %30)
  %31 = icmp ult i64 %30, 4294967296
  br i1 %31, label %if.end12, label %emit_call.exit13

emit_call.exit13:                                 ; preds = %if.end8
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %call1.i.i6 = tail call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.2, i64 0, i64 0), i8* %29) #16
  br label %cleanup

if.end12:                                         ; preds = %if.end8
  %32 = ptrtoint i8* %prog.sroa.0.1.in to i64
  call void @__asan_store1_noabort(i64 %32)
  store i8 -24, i8* %prog.sroa.0.1.in, align 1
  %add.ptr.i23.i.i8 = getelementptr i8, i8* %prog.sroa.0.1.in, i64 1
  %conv5.i.i9 = trunc i64 %sub.ptr.sub.i.i5 to i32
  %33 = bitcast i8* %add.ptr.i23.i.i8 to i32*
  %34 = ptrtoint i32* %33 to i64
  call void @__asan_store4_noabort(i64 %34)
  store i32 %conv5.i.i9, i32* %33, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  br i1 %mod_ret, label %if.then14, label %if.end12.if.end15_crit_edge

if.end12.if.end15_crit_edge:                      ; preds = %if.end12
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end15

if.then14:                                        ; preds = %if.end12
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %35 = bitcast i8* %add.ptr.i.i3 to i16*
  %36 = ptrtoint i16* %35 to i64
  call void @__asan_store2_noabort(i64 %36)
  store i16 -30392, i16* %35, align 2
  %add.ptr.i142.i = getelementptr i8, i8* %prog.sroa.0.1.in, i64 7
  %37 = bitcast i8* %add.ptr.i142.i to i16*
  %38 = ptrtoint i16* %37 to i64
  call void @__asan_store2_noabort(i64 %38)
  store i16 -1979, i16* %37, align 2
  %add.ptr.i132.i = getelementptr i8, i8* %prog.sroa.0.1.in, i64 9
  br label %if.end15

if.end15:                                         ; preds = %if.end12.if.end15_crit_edge, %if.then14
  %prog.sroa.0.3.ptr = phi i8* [ %add.ptr.i132.i, %if.then14 ], [ %add.ptr.i.i3, %if.end12.if.end15_crit_edge ]
  %39 = ptrtoint %struct.bpf_prog* %p to i64
  %40 = lshr i64 %39, 32
  %conv17 = trunc i64 %40 to i32
  %conv18 = trunc i64 %39 to i32
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %conv17)
  %41 = icmp eq i32 %conv17, 0
  br i1 %41, label %if.then.i15, label %do.body.i24

if.then.i15:                                      ; preds = %if.end15
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %conv18)
  %cmp16.i.i14 = icmp eq i32 %conv18, 0
  br i1 %cmp16.i.i14, label %if.then18.i.i16, label %if.end39.i.i18

if.then18.i.i16:                                  ; preds = %if.then.i15
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %42 = bitcast i8* %prog.sroa.0.3.ptr to i16*
  %43 = ptrtoint i16* %42 to i64
  call void @__asan_store2_noabort(i64 %43)
  store i16 -207, i16* %42, align 2
  br label %emit_mov_imm64.exit27

if.end39.i.i18:                                   ; preds = %if.then.i15
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %44 = ptrtoint i8* %prog.sroa.0.3.ptr to i64
  call void @__asan_store1_noabort(i64 %44)
  store i8 -65, i8* %prog.sroa.0.3.ptr, align 1
  %add.ptr.i94.i.i19 = getelementptr i8, i8* %prog.sroa.0.3.ptr, i64 1
  %45 = bitcast i8* %add.ptr.i94.i.i19 to i32*
  %46 = ptrtoint i32* %45 to i64
  call void @__asan_store4_noabort(i64 %46)
  store i32 %conv18, i32* %45, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  br label %emit_mov_imm64.exit27

do.body.i24:                                      ; preds = %if.end15
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %47 = bitcast i8* %prog.sroa.0.3.ptr to i16*
  %48 = ptrtoint i16* %47 to i64
  call void @__asan_store2_noabort(i64 %48)
  store i16 -16568, i16* %47, align 2
  %add.ptr.i31.i21 = getelementptr i8, i8* %prog.sroa.0.3.ptr, i64 2
  %49 = bitcast i8* %add.ptr.i31.i21 to i32*
  %50 = ptrtoint i32* %49 to i64
  call void @__asan_store4_noabort(i64 %50)
  store i32 %conv18, i32* %49, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i30.i22 = getelementptr i8, i8* %prog.sroa.0.3.ptr, i64 6
  %51 = bitcast i8* %add.ptr.i30.i22 to i32*
  %52 = ptrtoint i32* %51 to i64
  call void @__asan_store4_noabort(i64 %52)
  store i32 %conv17, i32* %51, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  br label %emit_mov_imm64.exit27

emit_mov_imm64.exit27:                            ; preds = %if.then18.i.i16, %if.end39.i.i18, %do.body.i24
  %.sink = phi i64 [ 2, %if.then18.i.i16 ], [ 5, %if.end39.i.i18 ], [ 10, %do.body.i24 ]
  %add.ptr.i102.i.i17 = getelementptr i8, i8* %prog.sroa.0.3.ptr, i64 %.sink
  %53 = bitcast i8* %add.ptr.i102.i.i17 to i32*
  %54 = ptrtoint i32* %53 to i64
  call void @__asan_store4_noabort(i64 %54)
  store i32 14584136, i32* %53, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %add.ptr.i.i30 = getelementptr i8, i8* %add.ptr.i102.i.i17, i64 8
  %sub.ptr.rhs.cast.i.i31 = ptrtoint i8* %add.ptr.i.i30 to i64
  %55 = sub i64 add (i64 ptrtoint (void (%struct.bpf_prog*, i64)* @__bpf_prog_exit to i64), i64 2147483648), %sub.ptr.rhs.cast.i.i31
  call void @__sanitizer_cov_trace_const_cmp8(i64 4294967296, i64 %55)
  %56 = icmp ult i64 %55, 4294967296
  br i1 %56, label %if.end22, label %emit_call.exit40

emit_call.exit40:                                 ; preds = %emit_mov_imm64.exit27
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %call1.i.i33 = tail call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.2, i64 0, i64 0), i8* bitcast (void (%struct.bpf_prog*, i64)* @__bpf_prog_exit to i8*)) #16
  br label %cleanup

if.end22:                                         ; preds = %emit_mov_imm64.exit27
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %add.ptr.i61.i29 = getelementptr i8, i8* %add.ptr.i102.i.i17, i64 3
  %57 = ptrtoint i8* %add.ptr.i61.i29 to i64
  call void @__asan_store1_noabort(i64 %57)
  store i8 -24, i8* %add.ptr.i61.i29, align 1
  %add.ptr.i23.i.i35 = getelementptr i8, i8* %add.ptr.i102.i.i17, i64 4
  %58 = trunc i64 %sub.ptr.rhs.cast.i.i31 to i32
  %conv5.i.i36 = sub i32 ptrtoint (void (%struct.bpf_prog*, i64)* @__bpf_prog_exit to i32), %58
  %59 = bitcast i8* %add.ptr.i23.i.i35 to i32*
  %60 = ptrtoint i32* %59 to i64
  call void @__asan_store4_noabort(i64 %60)
  store i32 %conv5.i.i36, i32* %59, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #15, !srcloc !43
  %61 = bitcast i8** %pprog to i64*
  %62 = ptrtoint i64* %61 to i64
  call void @__asan_store8_noabort(i64 %62)
  store i64 %sub.ptr.rhs.cast.i.i31, i64* %61, align 8
  br label %cleanup

cleanup:                                          ; preds = %emit_call.exit40, %emit_call.exit13, %emit_call.exit, %if.end22
  %retval.0 = phi i32 [ 0, %if.end22 ], [ -22, %emit_call.exit ], [ -22, %emit_call.exit13 ], [ -22, %emit_call.exit40 ]
  ret i32 %retval.0
}

; Function Attrs: noredzone
declare dso_local i64 @__bpf_prog_enter() #1

; Function Attrs: noredzone
declare dso_local void @__bpf_prog_exit(%struct.bpf_prog*, i64) #1

; Function Attrs: noredzone
declare dso_local void @__x86_indirect_thunk_rdx() #1

; Function Attrs: noredzone
declare dso_local noalias i8* @kmem_cache_alloc_trace(%struct.kmem_cache*, i32, i64) local_unnamed_addr #1

; Function Attrs: nounwind willreturn
declare void @llvm.assume(i1) #9

; Function Attrs: noredzone
declare dso_local noalias i8* @__kmalloc(i64, i32) local_unnamed_addr #1

; Function Attrs: nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #10

; Function Attrs: nofree norecurse noredzone nounwind sanitize_address sspstrong
define internal zeroext i1 @ex_handler_bpf(%struct.exception_table_entry* nocapture readonly %x, %struct.pt_regs* nocapture %regs, i32 %trapnr, i64 %error_code, i64 %fault_addr) #11 {
entry:
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %fixup = getelementptr inbounds %struct.exception_table_entry, %struct.exception_table_entry* %x, i64 0, i32 1
  %0 = ptrtoint i32* %fixup to i64
  call void @__asan_load4_noabort(i64 %0)
  %1 = load i32, i32* %fixup, align 4
  %shr = ashr i32 %1, 8
  %2 = bitcast %struct.pt_regs* %regs to i8*
  %idx.ext = zext i32 %shr to i64
  %add.ptr = getelementptr i8, i8* %2, i64 %idx.ext
  %3 = bitcast i8* %add.ptr to i64*
  %4 = ptrtoint i64* %3 to i64
  call void @__asan_store8_noabort(i64 %4)
  store i64 0, i64* %3, align 8
  %5 = load i32, i32* %fixup, align 4
  %and = and i32 %5, 255
  %conv = zext i32 %and to i64
  %ip = getelementptr inbounds %struct.pt_regs, %struct.pt_regs* %regs, i64 0, i32 16
  %6 = ptrtoint i64* %ip to i64
  call void @__asan_load8_noabort(i64 %6)
  %7 = load i64, i64* %ip, align 8
  %add = add i64 %7, %conv
  store i64 %add, i64* %ip, align 8
  ret i1 true
}

; Function Attrs: noredzone
declare dso_local i64 @__bpf_call_base(i64, i64, i64, i64, i64) #1

; Function Attrs: nobuiltin nofree noredzone
declare dso_local i8* @memset(i8*, i32, i64) local_unnamed_addr #12

; Function Attrs: noredzone
declare dso_local void @print_hex_dump(i8*, i8*, i32, i32, i32, i8*, i64, i1 zeroext) local_unnamed_addr #1

; Function Attrs: noredzone
declare dso_local i32 @set_memory_ro(i64, i32) local_unnamed_addr #1

; Function Attrs: noredzone
declare dso_local i32 @set_memory_x(i64, i32) local_unnamed_addr #1

; Function Attrs: noredzone
declare dso_local %struct.vm_struct* @find_vm_area(i8*) local_unnamed_addr #1

declare void @__sanitizer_cov_trace_pc_indir(i64)

declare void @__sanitizer_cov_trace_cmp1(i8 zeroext, i8 zeroext)

declare void @__sanitizer_cov_trace_cmp2(i16 zeroext, i16 zeroext)

declare void @__sanitizer_cov_trace_cmp4(i32 zeroext, i32 zeroext)

declare void @__sanitizer_cov_trace_cmp8(i64, i64)

declare void @__sanitizer_cov_trace_const_cmp1(i8 zeroext, i8 zeroext)

declare void @__sanitizer_cov_trace_const_cmp2(i16 zeroext, i16 zeroext)

declare void @__sanitizer_cov_trace_const_cmp4(i32 zeroext, i32 zeroext)

declare void @__sanitizer_cov_trace_const_cmp8(i64, i64)

declare void @__sanitizer_cov_trace_div4(i32 zeroext)

declare void @__sanitizer_cov_trace_div8(i64)

declare void @__sanitizer_cov_trace_gep(i64)

declare void @__sanitizer_cov_trace_switch(i64, i64*)

declare void @__sanitizer_cov_trace_pc()

declare void @__sanitizer_cov_trace_pc_guard(i32*)

declare void @__asan_report_load_n_noabort(i64, i64)

declare void @__asan_loadN_noabort(i64, i64)

declare void @__asan_report_load1_noabort(i64)

declare void @__asan_load1_noabort(i64)

declare void @__asan_report_load2_noabort(i64)

declare void @__asan_load2_noabort(i64)

declare void @__asan_report_load4_noabort(i64)

declare void @__asan_load4_noabort(i64)

declare void @__asan_report_load8_noabort(i64)

declare void @__asan_load8_noabort(i64)

declare void @__asan_report_load16_noabort(i64)

declare void @__asan_load16_noabort(i64)

declare void @__asan_report_store_n_noabort(i64, i64)

declare void @__asan_storeN_noabort(i64, i64)

declare void @__asan_report_store1_noabort(i64)

declare void @__asan_store1_noabort(i64)

declare void @__asan_report_store2_noabort(i64)

declare void @__asan_store2_noabort(i64)

declare void @__asan_report_store4_noabort(i64)

declare void @__asan_store4_noabort(i64)

declare void @__asan_report_store8_noabort(i64)

declare void @__asan_store8_noabort(i64)

declare void @__asan_report_store16_noabort(i64)

declare void @__asan_store16_noabort(i64)

declare void @__asan_report_exp_load_n_noabort(i64, i64, i32)

declare void @__asan_exp_loadN_noabort(i64, i64, i32)

declare void @__asan_report_exp_load1_noabort(i64, i32)

declare void @__asan_exp_load1_noabort(i64, i32)

declare void @__asan_report_exp_load2_noabort(i64, i32)

declare void @__asan_exp_load2_noabort(i64, i32)

declare void @__asan_report_exp_load4_noabort(i64, i32)

declare void @__asan_exp_load4_noabort(i64, i32)

declare void @__asan_report_exp_load8_noabort(i64, i32)

declare void @__asan_exp_load8_noabort(i64, i32)

declare void @__asan_report_exp_load16_noabort(i64, i32)

declare void @__asan_exp_load16_noabort(i64, i32)

declare void @__asan_report_exp_store_n_noabort(i64, i64, i32)

declare void @__asan_exp_storeN_noabort(i64, i64, i32)

declare void @__asan_report_exp_store1_noabort(i64, i32)

declare void @__asan_exp_store1_noabort(i64, i32)

declare void @__asan_report_exp_store2_noabort(i64, i32)

declare void @__asan_exp_store2_noabort(i64, i32)

declare void @__asan_report_exp_store4_noabort(i64, i32)

declare void @__asan_exp_store4_noabort(i64, i32)

declare void @__asan_report_exp_store8_noabort(i64, i32)

declare void @__asan_exp_store8_noabort(i64, i32)

declare void @__asan_report_exp_store16_noabort(i64, i32)

declare void @__asan_exp_store16_noabort(i64, i32)

declare i8* @memmove(i8*, i8*, i64)

declare void @__asan_handle_no_return()

declare void @__sanitizer_ptr_cmp(i64, i64)

declare void @__sanitizer_ptr_sub(i64, i64)

declare void @__asan_before_dynamic_init(i64)

declare void @__asan_after_dynamic_init()

declare void @__asan_register_globals(i64, i64)

declare void @__asan_unregister_globals(i64, i64)

declare void @__asan_register_image_globals(i64)

declare void @__asan_unregister_image_globals(i64)

declare void @__asan_register_elf_globals(i64, i64, i64)

declare void @__asan_unregister_elf_globals(i64, i64, i64)

attributes #0 = { noredzone nounwind sanitize_address sspstrong "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fentry-call"="true" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+retpoline-external-thunk,+retpoline-indirect-branches,+retpoline-indirect-calls,-3dnow,-3dnowa,-aes,-avx,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-f16c,-fma,-fma4,-gfni,-mmx,-pclmul,-sha,-sse,-sse2,-sse3,-sse4.1,-sse4.2,-sse4a,-ssse3,-vaes,-vpclmulqdq,-x87,-xop,-xsave,-xsaveopt" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noredzone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+retpoline-external-thunk,+retpoline-indirect-branches,+retpoline-indirect-calls,-3dnow,-3dnowa,-aes,-avx,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-f16c,-fma,-fma4,-gfni,-mmx,-pclmul,-sha,-sse,-sse2,-sse3,-sse4.1,-sse4.2,-sse4a,-ssse3,-vaes,-vpclmulqdq,-x87,-xop,-xsave,-xsaveopt" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { norecurse noredzone nounwind readonly sanitize_address sspstrong "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fentry-call"="true" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+retpoline-external-thunk,+retpoline-indirect-branches,+retpoline-indirect-calls,-3dnow,-3dnowa,-aes,-avx,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-f16c,-fma,-fma4,-gfni,-mmx,-pclmul,-sha,-sse,-sse2,-sse3,-sse4.1,-sse4.2,-sse4a,-ssse3,-vaes,-vpclmulqdq,-x87,-xop,-xsave,-xsaveopt" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { inlinehint noredzone nounwind sanitize_address sspstrong "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+retpoline-external-thunk,+retpoline-indirect-branches,+retpoline-indirect-calls,-3dnow,-3dnowa,-aes,-avx,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-f16c,-fma,-fma4,-gfni,-mmx,-pclmul,-sha,-sse,-sse2,-sse3,-sse4.1,-sse4.2,-sse4a,-ssse3,-vaes,-vpclmulqdq,-x87,-xop,-xsave,-xsaveopt" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { cold noredzone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+retpoline-external-thunk,+retpoline-indirect-branches,+retpoline-indirect-calls,-3dnow,-3dnowa,-aes,-avx,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-f16c,-fma,-fma4,-gfni,-mmx,-pclmul,-sha,-sse,-sse2,-sse3,-sse4.1,-sse4.2,-sse4a,-ssse3,-vaes,-vpclmulqdq,-x87,-xop,-xsave,-xsaveopt" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nofree noredzone nounwind sanitize_address sspstrong "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fentry-call"="true" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+retpoline-external-thunk,+retpoline-indirect-branches,+retpoline-indirect-calls,-3dnow,-3dnowa,-aes,-avx,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-f16c,-fma,-fma4,-gfni,-mmx,-pclmul,-sha,-sse,-sse2,-sse3,-sse4.1,-sse4.2,-sse4a,-ssse3,-vaes,-vpclmulqdq,-x87,-xop,-xsave,-xsaveopt" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nobuiltin nofree noredzone nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+retpoline-external-thunk,+retpoline-indirect-branches,+retpoline-indirect-calls,-3dnow,-3dnowa,-aes,-avx,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-f16c,-fma,-fma4,-gfni,-mmx,-pclmul,-sha,-sse,-sse2,-sse3,-sse4.1,-sse4.2,-sse4a,-ssse3,-vaes,-vpclmulqdq,-x87,-xop,-xsave,-xsaveopt" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nobuiltin nofree noredzone nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+retpoline-external-thunk,+retpoline-indirect-branches,+retpoline-indirect-calls,-3dnow,-3dnowa,-aes,-avx,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-f16c,-fma,-fma4,-gfni,-mmx,-pclmul,-sha,-sse,-sse2,-sse3,-sse4.1,-sse4.2,-sse4a,-ssse3,-vaes,-vpclmulqdq,-x87,-xop,-xsave,-xsaveopt" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nounwind willreturn }
attributes #10 = { nounwind readnone speculatable willreturn }
attributes #11 = { nofree norecurse noredzone nounwind sanitize_address sspstrong "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fentry-call"="true" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+retpoline-external-thunk,+retpoline-indirect-branches,+retpoline-indirect-calls,-3dnow,-3dnowa,-aes,-avx,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-f16c,-fma,-fma4,-gfni,-mmx,-pclmul,-sha,-sse,-sse2,-sse3,-sse4.1,-sse4.2,-sse4a,-ssse3,-vaes,-vpclmulqdq,-x87,-xop,-xsave,-xsaveopt" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { nobuiltin nofree noredzone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+retpoline-external-thunk,+retpoline-indirect-branches,+retpoline-indirect-calls,-3dnow,-3dnowa,-aes,-avx,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-f16c,-fma,-fma4,-gfni,-mmx,-pclmul,-sha,-sse,-sse2,-sse3,-sse4.1,-sse4.2,-sse4a,-ssse3,-vaes,-vpclmulqdq,-x87,-xop,-xsave,-xsaveopt" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { noredzone nounwind }
attributes #14 = { noredzone }
attributes #15 = { nounwind }
attributes #16 = { cold noredzone nounwind }
attributes #17 = { nobuiltin noredzone }
attributes #18 = { nounwind readnone }

!llvm.asan.globals = !{!0, !2, !4, !6, !8, !10, !12, !14, !16, !18, !20, !22, !24, !26, !28, !30, !32, !34, !36, !38}
!llvm.module.flags = !{!40, !41}
!llvm.ident = !{!42}

!0 = !{[28 x i8]* @.str, !1, !"<string literal>", i1 false, i1 false}
!1 = !{!"/home/lukenels/repo/linux/arch/x86/net/bpf_jit_comp.c", i32 1682, i32 6}
!2 = !{[40 x i8]* @.str.1, !3, !"<string literal>", i1 false, i1 false}
!3 = !{!"/home/lukenels/repo/linux/arch/x86/net/bpf_jit_comp.c", i32 1893, i32 5}
!4 = !{[34 x i8]* @.str.2, !5, !"<string literal>", i1 false, i1 false}
!5 = !{!"/home/lukenels/repo/linux/arch/x86/net/bpf_jit_comp.c", i32 265, i32 3}
!6 = !{[15 x i32]* @reg2hex, !7, !"reg2hex", i1 false, i1 false}
!7 = !{!"/home/lukenels/repo/linux/arch/x86/net/bpf_jit_comp.c", i32 115, i32 18}
!8 = !{[29 x i8]* @.str.3, !9, !"<string literal>", i1 false, i1 false}
!9 = !{!"/home/lukenels/repo/linux/arch/x86/net/bpf_jit_comp.c", i32 1456, i32 3}
!10 = distinct !{null, !11, !"<string literal>", i1 false, i1 false}
!11 = !{!"/home/lukenels/repo/linux/include/linux/slab.h", i32 385, i32 2}
!12 = !{[14 x i8]* @.str.5, !13, !"<string literal>", i1 false, i1 false}
!13 = !{!"/home/lukenels/repo/linux/arch/x86/net/bpf_jit_comp.c", i32 1050, i32 6}
!14 = !{[41 x i8]* @.str.6, !15, !"<string literal>", i1 false, i1 false}
!15 = !{!"/home/lukenels/repo/linux/arch/x86/net/bpf_jit_comp.c", i32 1057, i32 6}
!16 = !{[44 x i8]* @.str.7, !17, !"<string literal>", i1 false, i1 false}
!17 = !{!"/home/lukenels/repo/linux/arch/x86/net/bpf_jit_comp.c", i32 1064, i32 6}
!18 = !{[18 x i8]* @.str.8, !19, !"<string literal>", i1 false, i1 false}
!19 = !{!"/home/lukenels/repo/linux/arch/x86/net/bpf_jit_comp.c", i32 1070, i32 6}
!20 = distinct !{null, !21, !"<string literal>", i1 false, i1 false}
!21 = !{!"/home/lukenels/repo/linux/arch/x86/net/bpf_jit_comp.c", i32 1257, i32 5}
!22 = distinct !{null, !23, !"<string literal>", i1 false, i1 false}
!23 = !{!"/home/lukenels/repo/linux/arch/x86/net/bpf_jit_comp.c", i32 1284, i32 5}
!24 = !{[32 x i8]* @.str.11, !25, !"<string literal>", i1 false, i1 false}
!25 = !{!"/home/lukenels/repo/linux/arch/x86/net/bpf_jit_comp.c", i32 1314, i32 4}
!26 = !{[34 x i8]* @.str.12, !27, !"<string literal>", i1 false, i1 false}
!27 = !{!"/home/lukenels/repo/linux/arch/x86/net/bpf_jit_comp.c", i32 1320, i32 4}
!28 = !{[24 x i8]* @.str.13, !29, !"<string literal>", i1 false, i1 false}
!29 = !{!"/home/lukenels/repo/linux/arch/x86/net/bpf_jit_comp.c", i32 1326, i32 5}
!30 = !{[28 x i8]* @.str.14, !31, !"<string literal>", i1 false, i1 false}
!31 = !{!"/home/lukenels/repo/linux/arch/x86/net/bpf_jit_comp.c", i32 1337, i32 3}
!32 = !{[10 x i32]* @reg2pt_regs, !33, !"reg2pt_regs", i1 false, i1 false}
!33 = !{!"/home/lukenels/repo/linux/arch/x86/net/bpf_jit_comp.c", i32 132, i32 18}
!34 = !{[55 x i8]* @.str.15, !35, !"<string literal>", i1 false, i1 false}
!35 = !{!"/home/lukenels/repo/linux/include/linux/filter.h", i32 1003, i32 2}
!36 = !{[3 x i8]* @.str.16, !37, !"<string literal>", i1 false, i1 false}
!37 = !{!"/home/lukenels/repo/linux/include/linux/filter.h", i32 1007, i32 18}
!38 = !{[11 x i8]* @.str.17, !39, !"<string literal>", i1 false, i1 false}
!39 = !{!"/home/lukenels/repo/linux/include/linux/filter.h", i32 1007, i32 28}
!40 = !{i32 1, !"wchar_size", i32 2}
!41 = !{i32 1, !"Code Model", i32 2}
!42 = !{!"clang version 10.0.0-4ubuntu1 "}
!43 = !{i32 -2137876720}
!44 = !{!"branch_weights", i32 1, i32 2000}
!45 = !{!"misexpect", i64 1, i64 2000, i64 1}
!46 = !{i32 -2137813836, i32 -2137813829, i32 -2137813775, i32 -2137813744, i32 -2137813714}
!47 = !{i32 -2137813637, i32 -2137813608, i32 -2137813562, i32 -2137813504, i32 -2137813450, i32 -2137813396, i32 -2137813341, i32 -2137813310}
!48 = !{i32 -2137812889, i32 -2137812882, i32 -2137812830, i32 -2137812799, i32 -2137812769}
!49 = !{i32 -2137812707, i32 -2137812696, i32 -2137812645, i32 -2137812614, i32 -2137812584}
!50 = !{i32 -2146206023}
!51 = !{i8 0, i8 2}
!52 = !{!"branch_weights", i32 2000, i32 1}
!53 = !{i32 -2137857713, i32 -2137857706, i32 -2137857652, i32 -2137857621, i32 -2137857591}
!54 = !{i32 -2137857514, i32 -2137857485, i32 -2137857439, i32 -2137857381, i32 -2137857327, i32 -2137857273, i32 -2137857218, i32 -2137857187}
!55 = !{i32 -2137856767, i32 -2137856760, i32 -2137856708, i32 -2137856677, i32 -2137856647}
!56 = !{i32 -2137856585, i32 -2137856574, i32 -2137856523, i32 -2137856492, i32 -2137856462}
!57 = !{i32 -2137854009, i32 -2137854002, i32 -2137853948, i32 -2137853917, i32 -2137853887}
!58 = !{i32 -2137853810, i32 -2137853781, i32 -2137853735, i32 -2137853677, i32 -2137853623, i32 -2137853569, i32 -2137853514, i32 -2137853483}
!59 = !{i32 -2137853033, i32 -2137853026, i32 -2137852972, i32 -2137852941, i32 -2137852911}
