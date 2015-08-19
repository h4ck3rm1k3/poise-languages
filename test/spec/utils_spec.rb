#
# Copyright 2015, Noah Kantrowitz
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'spec_helper'

describe PoiseLanguages::Utils do
  describe '#absolute_command' do
    let(:path) { double('path') }
    let(:cmd) { }
    let(:which) { '/bin/myapp' }
    subject { described_class.absolute_command(cmd, path: path) }
    before do
      allow(described_class).to receive(:which).with('myapp', path: path).and_return(which)
    end

    context 'with a string' do
      let(:cmd) { 'myapp --port 8080' }
      it { is_expected.to eq '/bin/myapp --port 8080' }
    end # /context with a string

    context 'with an array' do
      let(:cmd) { %w{myapp --port 8080} }
      it { is_expected.to eq %w{/bin/myapp --port 8080} }
    end # /context with an array

    context 'with options' do
      let(:cmd) { '--port 8080' }
      it { is_expected.to eq '--port 8080' }
    end # /context with options

    context 'with an unknown command' do
      let(:cmd) { 'myapp --port 8080' }
      let(:which) { false }
      it { is_expected.to eq 'myapp --port 8080' }
    end # /context with an unknown command
  end # /describe #absolute_command

  describe '#which' do
    # See utils/which_spec.rb for real tests.
    it { is_expected.to respond_to :which }
  end # /describe #which
end