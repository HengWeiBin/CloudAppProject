from transformers import TFGPT2LMHeadModel, GPT2Tokenizer
import random
import os
import time
from googletrans import Translator
import fire
import numpy as np
import tensorflow as tf

def getTokenizer(tokenizer_save_path):
    print("Using pretrained tokenizer...")
    # loading tokenizer from the saved model path
    tokenizer = GPT2Tokenizer.from_pretrained(tokenizer_save_path)

    tokenizer.add_special_tokens({
      "eos_token": "</s>",
      "bos_token": "<s>",
      "unk_token": "<unk>",
      "pad_token": "<pad>",
      "mask_token": "<mask>"
    })
    
    return tokenizer

def getHighQuality(eos_token, beam_output):
    beam_list = []
    for output in beam_output:
        output = output.numpy()
        output = list(np.delete(output, np.argwhere(output==eos_token)))
        beam_list.append(output)
    output = max(beam_list, key=lambda x:len(x))
    return tf.convert_to_tensor(output, dtype="int32")

def main(highQualityMode=False):
    dir_path = os.path.dirname(os.path.realpath(__file__))
    tokenizer_save_path = dir_path + "/saved_tokenizer"
    model_out_dir = dir_path + "/model/"
    input_dir = dir_path + "/input.txt"
    output_dir = dir_path + "/output.txt"
    
    try:
        with open(input_dir, 'r') as r:
            text = r.read()
        os.remove(input_dir)
    except:
        raise SystemExit("Input not found!")
        
    translator = Translator()
    lang = translator.detect(text).lang
    if lang != "zh-CN":
        text = translator.translate(text, dest="zh-tw").text
        
    #load pretrained model
    tokenizer = getTokenizer(tokenizer_save_path)
    model = TFGPT2LMHeadModel.from_pretrained(model_out_dir)
        
    # encoding the input text
    start = time.time()
    input_ids = tokenizer.encode(text, return_tensors='tf')
    
    # generate output
    NUM_SEQUENCE = 3 if highQualityMode else 1
    beam_output = model.generate(
      input_ids,
      max_length = 1000,
      num_beams = int(random.random() * 10) + 1,
      temperature = random.random() * 10 % 5 / 10 + 0.5,
      no_repeat_ngram_size = 2,
      num_return_sequences = NUM_SEQUENCE,
      top_k = int(random.random() * 100 % 40),
      top_p = 1
    )
    
    beam_output = getHighQuality(tokenizer.eos_token_id, beam_output)
    
    with open(output_dir, 'w') as w:
        w.write("Time used: " + str(time.time() - start) + '\n')
        
        if lang != "zh-CN":
            output = translator.translate(tokenizer.decode(beam_output), dest=lang).text
        else:
            output = tokenizer.decode(beam_output)
            
        w.write(output)
        
if __name__ == "__main__":
    fire.Fire(main)