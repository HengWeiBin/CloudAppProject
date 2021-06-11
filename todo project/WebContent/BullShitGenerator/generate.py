from transformers import TFGPT2LMHeadModel, GPT2Tokenizer
import random
import os
import time

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

if __name__ == "__main__":
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
        
    #load pretrained model
    tokenizer = getTokenizer(tokenizer_save_path)
    model = TFGPT2LMHeadModel.from_pretrained(model_out_dir)
        
    # encoding the input text
    start = time.time()
    input_ids = tokenizer.encode(text, return_tensors='tf')
    
    # generate output
    beam_output = model.generate(
      input_ids,
      max_length = 1000,
      num_beams = int(random.random() * 10) + 1,
      temperature = random.random() * 10 % 5 / 10 + 0.5,
      no_repeat_ngram_size = 2,
      num_return_sequences = 1,
      top_k = int(random.random() * 100 % 40),
      top_p = 1
    )
    
    with open(output_dir, 'w') as w:
        w.write("Time used: " + str(time.time() - start) + '\n')
        w.write(tokenizer.decode(beam_output[0]))