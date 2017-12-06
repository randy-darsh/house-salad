require 'rails_helper'

describe 'User can search for representatives by state' do
  it 'with a valid state name' do
    VCR.use_cassette("user_searches_by_state") do
      visit root_path

      select 'Colorado', from: 'stateSelect'

      click_on 'Locate Members from the House'

      expect(current_path).to eq(search_path)

      url = URI.parse(current_url).to_s
      expect(url).to include ('state=CO')
      expect(page).to have_content('7 Results')

      within('.representatives') do
        expect(page).to have_selector('.representative', count: 7)
      end

      # And they should be ordered by seniority from most to least
      # Need to do this

      within(first('.representative')) do
        expect(page).to have_selector('.name')
        expect(page).to have_selector('.role')
        expect(page).to have_selector('.party')
        expect(page).to have_selector('.district')
      end
    end
  end
end
