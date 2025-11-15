#!/usr/bin/env python3
import re

# relative path
base_bias_path = 'base_bias.pl'
bias_path = 'bias.pl'
log_path = 'trace.log'
bk_path = 'bk.pl'
exs_path = 'exs.pl'

def augment_bias():

    # element
    bias_elements = []
    tasks_chunks = task_chunk_dictionary()

    # generate new bias
    try:
        with open(base_bias_path, 'r') as file:
            for line in file:
                line = line.strip()
                # release line
                if 'release' in line:
                    for task in sorted(list(tasks_chunks.keys())):
                        new_line = line.replace('release', f'release_{task}')
                        bias_elements.append(new_line)
                # complete line
                elif 'complete' in line:
                    for task in sorted(list(tasks_chunks.keys())):
                        new_line = line.replace('complete', f'complete_{task}')
                        bias_elements.append(new_line)
                # execute line
                elif 'execute' in line:
                    for task in sorted(list(tasks_chunks.keys())):
                        for chunk in sorted(list(tasks_chunks[task])):
                            new_line = line.replace('execute', f'execute_{task}_{chunk}')
                            bias_elements.append(new_line)
                # finish line
                elif 'finish' in line:
                    for task in sorted(list(tasks_chunks.keys())):
                        for chunk in sorted(list(tasks_chunks[task])):
                            new_line = line.replace('finish', f'finish_{task}_{chunk}')
                            bias_elements.append(new_line)
                # other lines
                else:
                    bias_elements.append(line)
    except FileNotFoundError:
        print(f"Error: {base_bias_path} not found.")
        return
    except Exception as e:
        print(f"An error occurred during file copy: {e}")
        return

    # Write the output files
    with open(bias_path, 'w') as output:
        for bias_element in bias_elements:
            output.write(f"{bias_element}\n")
    print('bias.pl sucessfully generated!!!')

def generate_bk_exs():

    # element
    bk_elements = []
    bk_elements.append(':-style_check(-discontiguous). % dont considere the discountinuity of clauses\n')
    exs_elements = []
    exs_elements.append(':-style_check(-discontiguous). % dont considere the discountinuity of clauses\n')
    trace_id = 0

    try:
        with open(log_path, 'r') as file:
            for line in file:
                line = line.strip()
                # skip blank line
                if not line:
                    continue
                # handling end line
                if 'end' in line:
                    bk_elements.append('')
                    exs_elements.append(f'neg(failure(trace{trace_id})).')
                    trace_id += 1
                    continue
                # handling deadlineMiss line
                if 'deadlineMiss' in line:
                    bk_elements.append('')
                    exs_elements.append(f'pos(failure(trace{trace_id})).')
                    trace_id += 1
                    continue
                # handling release line
                if 'release' in line:
                    match = re.search(r'<(\d+\.\d+).*?Task(\d+)', line)
                    if match:
                        time = match.group(1)
                        time = int(float(time)*1000) # time in microseconds
                        task_id = match.group(2)
                        bk_element = (f'release_{task_id}(trace{trace_id}, {time}).')
                        bk_elements.append(bk_element)
                # handling complete line
                if 'complete' in line:
                    match = re.search(r'<(\d+\.\d+).*?Task(\d+)', line)
                    if match:
                        time = match.group(1)
                        time = int(float(time)*1000) # time in microseconds
                        task_id = match.group(2)
                        bk_element = (f'complete_{task_id}(trace{trace_id}, {time}).')
                        bk_elements.append(bk_element)
                # handling execute line
                if 'execute' in line:
                    match = re.search(r'<(\d+\.\d+).*?Chunk(\d+).(\d+)', line)
                    if match:
                        time = match.group(1)
                        time = int(float(time)*1000) # time in microseconds
                        task_id = match.group(2)
                        chunk_id = match.group(3)
                        bk_element = (f'execute_{task_id}_{chunk_id}(trace{trace_id}, {time}).')
                        bk_elements.append(bk_element)
                # handling finish line
                if 'finish' in line:
                    match = re.search(r'<(\d+\.\d+).*?Chunk(\d+).(\d+)', line)
                    if match:
                        time = match.group(1)
                        time = int(float(time)*1000) # time in microseconds
                        task_id = match.group(2)
                        chunk_id = match.group(3)
                        bk_element = (f'finish_{task_id}_{chunk_id}(trace{trace_id}, {time}).')
                        bk_elements.append(bk_element)

    # exception handling
    except FileNotFoundError:
        print(f"Error: Input file not found at {log_path}")
        return
    except Exception as e:
        print(f"An error occurred: {e}")
        return

    # Write the output files
    with open(bk_path, 'w') as output:
        for bk_element in bk_elements:
            output.write(f"{bk_element}\n")
    print('bk.pl sucessfully generated!!!')
    with open(exs_path, 'w') as output:
        for exs_element in exs_elements:
            output.write(f"{exs_element}\n")
    print('exs.pl sucessfully generated!!!')

### helper ###
def task_chunk_dictionary():
    task_chunks = {}
    try:
        with open(log_path, 'r') as file:
            for line in file:
                line = line.strip()
                # key (tasks) initialization
                if 'release' in line:
                    match = re.search(r'Task(\d+)', line)
                    if match:
                        task_id = int(match.group(1))
                        if task_id not in task_chunks:
                            task_chunks[task_id] = set()
                # value (chunks for task) appending
                elif 'execute' in line:
                    match = re.search(r'Chunk(\d+).(\d+)', line)
                    if match:
                        task_id = int(match.group(1))
                        chunk_id = int(match.group(2))
                        task_chunks[task_id].add(chunk_id)
    except FileNotFoundError:
        print(f"Error: {log_path} not found.")
        return None
    except Exception as e:
        print(f"An error occurred: {e}")
        return None
    return task_chunks

### main ###
if __name__ == '__main__':
    augment_bias()
    generate_bk_exs()