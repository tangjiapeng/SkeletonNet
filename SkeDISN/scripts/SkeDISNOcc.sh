gpu=2
nepoch=10
batchsize=10
lr=3e-6
decay_step=80000
num_sample_points=2048
restore_modeldisn='checkpoint/disn_occ/model.ckpt'
log_dir='checkpoint/skedisn_occ'
restore_modelfreeskeleton='checkpoint/skedisn_freeskeleton_occ'
predvox_dir='{specify your generated skeleton volume directory}'

python train/train_sdf_add_skevox.py --ske_local_patch_share --binary --img_feat_twostream  --gpu $gpu \
    --restore_model $restore_modelfreeskeleton --restore_modeldisn $restore_modeldisn --log_dir $log_dir \
    --category 'all' --num_sample_points $num_sample_points --use_predvox --predvox_dir $predvox_dir \
    --max_epoch $nepoch --batch_size $batchsize --learning_rate $lr --decay_step $decay_step --cat_limit 36037
