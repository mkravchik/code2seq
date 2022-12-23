###########################################################
# Change the following values to train a new model.
# type: the name of the new model, only affects the saved file name.
# dataset: the name of the dataset, as was preprocessed using preprocess.sh
# test_data: by default, points to the validation set, since this is the set that
#   will be evaluated after each training iteration. If you wish to test
#   on the final (held-out) test set, change 'val' to 'test'.
type=dataset #java-large-model
dataset_name=dataset # java-large
data_dir=../cppminer/out1/data/dataset # data/java-large
data=${data_dir}/${dataset_name}
val_data=${data_dir}/${dataset_name}.val.c2s
test_data=${data_dir}/${dataset_name}.test.c2s
train_data=${data_dir}/${dataset_name}.train.c2s

model_dir=models/${type}

mkdir -p ${model_dir}
set -e
python3 -u code2seq.py --data ${data} --test ${val_data} --save_path ${model_dir}/model --model_path ${model_dir}/model
echo "Evaluating on train set"
python3 -u code2seq.py --test ${train_data} --load_path ${model_dir}/model --model_path ${model_dir}/model
echo "Evaluating on validation set"
python3 -u code2seq.py --test ${val_data} --load_path ${model_dir}/model --model_path ${model_dir}/model
echo "Evaluating on test set"
python3 -u code2seq.py --test ${test_data} --load_path ${model_dir}/model --model_path ${model_dir}/model
