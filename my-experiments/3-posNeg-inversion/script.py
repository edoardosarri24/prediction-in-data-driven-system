#!/usr/bin/env python3

'''
The script must be and run from the project directory.
Usage: ./script
'''
def log_to_bk():

    # relative path
    log_path = 'trace.log'
    bk_path = 'bk.pl'
    exs_path = 'exs.pl'

    # element
    bk_elements = []
    bk_elements.append(':-style_check(-discontiguous). % dont considere the discountinuity of clauses\n')
    exs_elements = []
    exs_elements.append(':-style_check(-discontiguous). % dont considere the discountinuity of clauses\n')
    trace_id = 0

    try:
        with open(log_path, 'r') as f:
            for line in f:
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

                # Split the line into the event and the timestamp
                parts = line.rsplit(' ')
                time = parts[1][1:-1]
                time = int(float(time)*1000) # time in microseconds
                event = parts[2]
                element = parts[3][0:-1]

                # define and append bk_element
                firstChar = element[0]
                if (firstChar == 'T'):
                    task_id = element[-1]
                    bk_element = (f'{event}(trace{trace_id}, {time}, task{task_id}).')
                elif(firstChar == 'C'):
                    task_id = element[-3]
                    chunk_id = element[-1]
                    bk_element = (f'{event}(trace{trace_id}, {time}, task{task_id}, chunk{chunk_id}).')
                else:
                    exit("Error: invalid element")
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

### main ###
if __name__ == '__main__':
    log_to_bk()